from aiomysql.connection import Connection


async def add_to_portfolio(user_id: int, bond_id: int, quantity: int, purchase_price: float, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM portfolio WHERE user_id = %s AND bond_id = %s""", (user_id, bond_id))
            exists = await cursor.fetchone()
            if not exists:
                await cursor.execute("""INSERT INTO portfolio (user_id, bond_id, quantity, purchase_price)
                                    VALUES (%s, %s, %s, %s)""", (user_id, bond_id, quantity, purchase_price))
            else:
                await cursor.execute("""UPDATE portfolio SET quantity = quantity+%s, purchase_price = (purchase_price+%s)/2
                                    WHERE user_id = %s AND bond_id = %s""", (quantity, purchase_price, user_id, bond_id))

            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def remove_from_portfolio(user_id: int, bond_id: int, quantity: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE portfolio SET quantity = quantity-%s WHERE user_id = %s AND bond_id = %s""",
                                 (quantity, user_id, bond_id))

            await conn.commit()

            await cursor.execute("""DELETE FROM portfolio WHERE quantity = 0""")
            await conn.commit()

        except Exception as err:
            print(err)

        await cursor.close()


async def get_portfolio_details(user_id, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT COUNT(user_id) as no_bonds, SUM(quantity) AS total_quantity, SUM(quantity*purchase_price) as total_amount 
                                    FROM portfolio, bonds WHERE portfolio.bond_id = bonds.bond_id AND user_id = %s""", (user_id))
            stats = await cursor.fetchone()

            await cursor.execute("""SELECT * FROM portfolio, bonds WHERE portfolio.bond_id = bonds.bond_id AND user_id = %s""", (user_id))

            bond_data = await cursor.fetchall()
        except Exception as err:
            print(err)

    return stats, bond_data
