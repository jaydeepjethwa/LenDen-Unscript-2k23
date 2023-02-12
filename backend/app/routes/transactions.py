from fastapi import APIRouter, Depends
from fastapi.responses import Response
from fastapi.background import BackgroundTasks
from ..models.transactions import NewTransaction
from ..database import Database
from ..database.transactions import add_transaction, get_user_transactions, get_broker_earnings
from ..database.bonds import remove_bonds_from_pool, add_bonds_to_pool
from ..database.portfolio import add_to_portfolio, remove_from_portfolio
from ..database.users import debit_from_wallet, deposit_to_wallet
from aiomysql.connection import Connection


txn_router = APIRouter()


@txn_router.post("/create")
async def create_transaction(txn: NewTransaction, conn: Connection = Depends(Database.get_db)):
    await add_transaction(txn, conn)

    if txn.type == "BUY":
        await remove_bonds_from_pool(txn.bond_id, txn.quantity, conn)
        await add_to_portfolio(txn.user_id, txn.bond_id, txn.quantity, txn.transaction_price, conn)
        await debit_from_wallet(txn.user_id, (txn.transaction_price * txn.quantity), conn)
    else:
        await add_bonds_to_pool(txn.bond_id, txn.quantity, conn)
        await remove_from_portfolio(txn.user_id, txn.bond_id, txn.quantity, conn)
        await deposit_to_wallet(txn.user_id, (txn.transaction_price * txn.quantity), conn)

    return {
        "message": "Success"
    }


@ txn_router.get("/user/{user_id}")
async def user_transactions(user_id: int, conn: Connection = Depends(Database.get_db)):
    transactions = await get_user_transactions(user_id, conn)

    return transactions


@txn_router.get("/broker-earnings")
async def broker_earnings(conn: Connection = Depends(Database.get_db)):
    earnings = await get_broker_earnings(conn)

    return earnings
