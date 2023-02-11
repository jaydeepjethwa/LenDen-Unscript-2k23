from fastapi import APIRouter, Body, Depends, UploadFile
from ..auth import JWTBearer
from ..models.user import UserKYC
from ..database.user import add_user_data
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

    await add_user_data(user_id, name, contact_no, profile_photo, pan_card, bank_detail, address_proof, conn)

    return {
        "message": "Success"
    }
