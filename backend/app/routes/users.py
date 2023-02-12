from ..models.users import UserKYC
from fastapi import APIRouter, Body, Depends, UploadFile
from ..auth import JWTBearer
from ..database.users import get_all_user_details, get_user_details, add_user_data, get_verification_count, update_kyc_status, get_kyc_status, deposit_to_wallet, get_wallet_balance
from ..database import Database
from aiomysql.connection import Connection
import base64

user_router = APIRouter()


@user_router.post("/complete-kyc", dependencies=[Depends(JWTBearer())])
async def kyc_details(profile_photo: UploadFile, pan_card: UploadFile, bank_detail: UploadFile, address_proof: UploadFile,
                      user_id: int = Body(...), name: str = Body(...), contact_no: str = Body(...), conn: Connection = Depends(Database.get_db)):

    profile_photo = base64.b64encode(await profile_photo.read())
    pan_card = base64.b64encode(await pan_card.read())
    bank_detail = base64.b64encode(await bank_detail.read())
    address_proof = base64.b64encode(await address_proof.read())
    user = UserKYC(user_id=user_id, name=name, contact_no=contact_no)

    await add_user_data(user, profile_photo, pan_card, bank_detail, address_proof, conn)

    return {
        "message": "Success"
    }


@user_router.get("/verified-count")
async def verified_user_count(conn: Connection = Depends(Database.get_db)):
    count = await get_verification_count(conn, 1)

    return count


@user_router.get("/unverified-count")
async def unverified_user_count(conn: Connection = Depends(Database.get_db)):
    count = await get_verification_count(conn, 0)

    return count


@user_router.get("/all")
async def every_user_details(conn: Connection = Depends(Database.get_db)):
    user_details = await get_all_user_details(conn)

    return user_details


@user_router.get("/kyc-status/{user_id}")
async def kyc_status(user_id: int, conn: Connection = Depends(Database.get_db)):
    status = await get_kyc_status(user_id, conn)

    return status


@user_router.post("/approve-kyc/{user_id}")
async def approve_kyc(user_id: int, conn: Connection = Depends(Database.get_db)):
    await update_kyc_status(user_id, conn)

    return {
        "message": "Success"
    }


@user_router.get("/{user_id}")
async def user_details(user_id: int, conn: Connection = Depends(Database.get_db)):
    user_details = await get_user_details(user_id, conn)

    return user_details


@user_router.post("/deposit-money")
async def deposit_money(user_id: int = Body(...), amount: float = Body(...), conn: Connection = Depends(Database.get_db)):
    await deposit_to_wallet(user_id, amount, conn)

    return {
        "message": "Success"
    }


@user_router.get("/wallet-balance/{user_id}")
async def wallet_balance(user_id: int, conn: Connection = Depends(Database.get_db)):
    balance = await get_wallet_balance(user_id, conn)

    return balance
