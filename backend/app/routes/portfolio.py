from fastapi import APIRouter, Depends
from ..database import Database
from ..database.portfolio import get_portfolio_details
from aiomysql.connection import Connection


portfolio_router = APIRouter()


@portfolio_router.get("/{user_id}")
async def my_portfolio(user_id: str, conn: Connection = Depends(Database.get_db)):
    stats, bonds_data = await get_portfolio_details(user_id, conn)

    return {
        "stats": stats,
        "bonds_data": bonds_data
    }
