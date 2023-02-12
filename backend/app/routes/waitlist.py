from fastapi import APIRouter, Depends
from ..models.waitlist import Waitlist
from ..database import Database
from ..database.waitlist import add_to_waitlist, get_user_waitlist, get_waitlist
from aiomysql.connection import Connection

waitlist_router = APIRouter()


@waitlist_router.post("/join")
async def join_waitlist(wait: Waitlist, conn: Connection = Depends(Database.get_db)):
    await add_to_waitlist(wait, conn)

    return {
        "message": "Success"
    }


@waitlist_router.get("/")
async def all_waitlist(conn: Connection = Depends(Database.get_db)):
    list = await get_waitlist(conn)

    return list


@waitlist_router.get("/{user_id}")
async def user_waitlist(user_id: int, conn: Connection = Depends(Database.get_db)):
    list = await get_user_waitlist(user_id, conn)

    return list
