from fastapi import APIRouter, Depends, Body
from ..database.bonds import get_all_bonds, get_bond
from ..database import Database
from aiomysql.connection import Connection

bond_router = APIRouter()


@bond_router.get("/all")
async def all_bonds(conn: Connection = Depends(Database.get_db)):
    bonds = await get_all_bonds(conn)

    return bonds


@bond_router.get("/{bond_id}")
async def bond_details(bond_id: int, conn: Connection = Depends(Database.get_db)):
    bond_data = await get_bond(bond_id, conn)

    return bond_data
