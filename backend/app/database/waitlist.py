from aiomysql.connection import Connection
from ..models.waitlist import Waitlist


async def add_to_waitlist(wait: Waitlist, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""INSERT INTO waitlist (user_id, bond_id, quantity, price) 
                                    VALUES (%s, %s, %s, %s)""", (wait.user_id, wait.bond_id, wait.quantity, wait.price))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def check_waitlist(bond_id: int, price: int, available_qty: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM waitlist WHERE bond_id = %s AND price >= %s ORDER BY joining_time DESC""", (bond_id, price))
            eligible_users = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return eligible_users


async def update_waitlist(wait_id: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""DELETE FROM waitlist WHERE wait_id = %s""", (wait_id))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def get_user_waitlist(user_id: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM waitlist, bonds WHERE waitlist.bond_id = bonds.bond_id AND user_id = %s""", (user_id))
            list = await cursor.fetchall()
        except Exception as err:
            print(err)

        await cursor.close()

    return list
