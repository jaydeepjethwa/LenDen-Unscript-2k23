from aiomysql.connection import Connection
from ..models.bonds import Bond


async def get_all_bonds(conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM bonds""")
            bonds = await cursor.fetchall()
        except Exception as err:
            print(err)

        await cursor.close()

    return bonds


async def get_bond(bond_id: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM bonds WHERE bond_id = %s""", (bond_id))
            bond = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return bond


async def get_latest_bonds(conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM bonds ORDER BY released_on DESC LIMIT 5""")
            latest_bonds = await cursor.fetchall()
        except Exception as err:
            print(err)

        await cursor.close()

    return latest_bonds


async def get_featured_bonds(conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM bonds WHERE is_featured = 1 ORDER BY released_on DESC""")
            latest_bonds = await cursor.fetchall()
        except Exception as err:
            print(err)

        await cursor.close()

    return latest_bonds


async def change_featured_status(bond_id: int, status: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE bonds SET is_featured = %s WHERE bond_id = %s""", (status, bond_id))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def remove_bonds_from_pool(bond_id: int, quantity: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE bonds SET Qty = Qty-%s WHERE bond_id = %s""", (quantity, bond_id))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def add_bonds_to_pool(bond_id: int, quantity: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE bonds SET Qty = Qty+%s WHERE bond_id = %s""", (quantity, bond_id))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def release_new_bond(bond: Bond, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""INSERT INTO bonds (Symbol, Series, BondType, Open, High, Low, LTP, Close, PercentageChange, Qty, Value, CouponRate, credit_rating, rating_agency, face_value, maturity_date, bYield, isin, companyName)
                                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                                 (bond.Symbol, bond.Series, bond.BondType, bond.Open, bond.High, bond.Low, bond.LTP, bond.Close, bond.PercentageChange, bond.Qty, bond.Value, bond.CouponRate, bond.credit_rating, bond.rating_agency, bond.face_value, bond.maturity_date, bond.bYield, bond.isin, bond.companyName))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def set_bond_price_get_qty(bond_id: int, price: float, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE bonds SET LTP = %s WHERE bond_id = %s""", (price, bond_id))
            await conn.commit()

            await cursor.execute("""SELECT Qty FROM bonds WHERE bond_id = %s""", (bond_id))
            quantity = await cursor.fetchone()

        except Exception as err:
            print(err)

        await cursor.close()

    return quantity
