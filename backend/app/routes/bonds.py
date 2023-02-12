from fastapi import APIRouter, Depends, Body
from fastapi.responses import Response
from fastapi.background import BackgroundTasks
from ..models.bonds import Bond
from ..models.transactions import NewTransaction
from ..database.bonds import get_all_bonds, get_bond, get_latest_bonds, get_featured_bonds, change_featured_status, release_new_bond, set_bond_price_get_qty, remove_bonds_from_pool
from ..database import Database
from ..database.users import get_all_user_details
from ..database.waitlist import check_waitlist, update_waitlist
from ..database.transactions import add_transaction
from ..database.portfolio import add_to_portfolio
from ..database.users import debit_from_wallet, get_user_details
from aiomysql.connection import Connection
import smtplib
import ssl
from email.message import EmailMessage
from decouple import config

bond_router = APIRouter()


@bond_router.get("/all")
async def all_bonds(conn: Connection = Depends(Database.get_db)):
    bonds = await get_all_bonds(conn)

    return bonds


@bond_router.get("/latest")
async def latest_bonds(conn: Connection = Depends(Database.get_db)):
    latest_bonds = await get_latest_bonds(conn)

    return latest_bonds


@bond_router.get("/featured")
async def featured_bonds(conn: Connection = Depends(Database.get_db)):
    featured_bonds = await get_featured_bonds(conn)

    return featured_bonds


@bond_router.post("/featured-status")
async def featured_status(bond_id: int = Body(...), status: int = Body(...), conn: Connection = Depends(Database.get_db)):
    await change_featured_status(bond_id, status, conn)

    return {
        "message": "Success"
    }


@bond_router.post("/update-price")
async def update_price(bond_id: int = Body(...), price: float = Body(...), conn: Connection = Depends(Database.get_db)):
    quantity = await set_bond_price_get_qty(bond_id, price)
    eligible_users = await check_waitlist(bond_id, price, quantity, conn)

    if eligible_users:
        txn = NewTransaction(
            bond_id, eligible_users["quantity"], price, eligible_users["user_id"], type="BUY")
        await add_transaction(txn, conn)
        await remove_bonds_from_pool(txn.bond_id, txn.quantity, conn)
        await add_to_portfolio(txn.user_id, txn.bond_id, txn.quantity, txn.transaction_price, conn)
        await debit_from_wallet(txn.user_id, (txn.transaction_price * txn.quantity), conn)

        await update_waitlist(eligible_users["wait_id"])

        user_data = await get_user_details(eligible_users["user_id"], conn)
        email = user_data["email"]

        port = 465
        smtp_server = "smtp.gmail.com"

        msg = EmailMessage()
        msg.set_content(
            f"Your Auto Transaction for bond id: {eligible_users['bond_id']} has been successfully completed.")
        msg["Subject"] = "Waitlist Transaction Successful"
        sender_email = config("EMAIL")
        sender_pass = config("EPASS")
        msg["From"] = sender_email
        msg["To"] = email

        context = ssl.create_default_context()
        with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
            server.login(sender_email, sender_pass)
            server.send_message(msg, from_addr=sender_email,
                                to_addrs=email)

    return {
        "message": "Success"
    }


async def send_emails(companyName, conn: Connection):
    users = await get_all_user_details(conn)

    port = 465
    smtp_server = "smtp.gmail.com"

    msg = EmailMessage()
    msg.set_content(
        f"{companyName} has released new bonds.\nAvail them at the earliest, exclusively on our LenDen Mobile App")
    msg["Subject"] = f"New {companyName} Bond Released!"
    sender_email = config("EMAIL")
    sender_pass = config("EPASS")
    msg["From"] = sender_email
    receiver_emails = [user["email"] for user in users]
    msg["To"] = ", ".join(receiver_emails)
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
        server.login(sender_email, sender_pass)
        server.send_message(msg=msg, from_addr=sender_email,
                            to_addrs=receiver_emails)


@bond_router.post("/add-bond")
async def add_bond(bond: Bond, conn: Connection = Depends(Database.get_db), bg_task: BackgroundTasks = None):
    await release_new_bond(bond, conn)

    bg_task.add_task(send_emails, bond.companyName, conn)

    return Response(content="Success", background=bg_task)


@bond_router.get("/{bond_id}")
async def bond_details(bond_id: int, conn: Connection = Depends(Database.get_db)):
    bond_data = await get_bond(bond_id, conn)

    return bond_data
