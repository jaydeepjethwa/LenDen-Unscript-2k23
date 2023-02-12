from fastapi import APIRouter, Depends
from aiomysql.connection import Connection
from ..models.users import User
from ..database import Database
from ..database.users import user_login
from ..auth import signJWT
import random
import smtplib
import ssl
from email.message import EmailMessage
from decouple import config


auth_router = APIRouter()


@auth_router.post("/login")
async def login(user: User, conn: Connection = Depends(Database.get_db)):

    user_id = await user_login(user, conn)

    otp = str(random.randint(1000, 9999))

    port = 465
    smtp_server = "smtp.gmail.com"

    msg = EmailMessage()
    msg.set_content(f"Your OTP To Log In your account is: {otp}")
    msg["Subject"] = "Login OTP - LenDen"
    sender_email = config("EMAIL")
    sender_pass = config("EPASS")
    msg["From"] = sender_email
    msg["To"] = user.email

    context = ssl.create_default_context()
    with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
        server.login(sender_email, sender_pass)
        server.send_message(msg, from_addr=sender_email,
                            to_addrs=user.email)

    return {
        "user_id": user_id,
        "access_token": signJWT(user.email),
        "otp": otp
    }
