from fastapi import APIRouter, Depends, Body
from aiomysql.connection import Connection
from ..models.user import User
from ..database import Database
from ..database.user import user_login
from ..auth import signJWT
import random

auth_router = APIRouter()


@auth_router.post("/login")
async def login(user: User = Body(), conn: Connection = Depends(Database.get_db)):

    user_id, kyc_completed = await user_login(user, conn)

    return {
        "user_id": user_id,
        "kyc_completed": kyc_completed,
        "access_token": signJWT(user.email),
        "otp": str(random.randint(1000, 9999))
    }
