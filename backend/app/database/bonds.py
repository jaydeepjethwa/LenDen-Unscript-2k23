from aiomysql.connection import Connection


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
