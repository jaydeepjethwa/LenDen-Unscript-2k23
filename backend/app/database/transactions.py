from aiomysql.connection import Connection
from ..models.transactions import NewTransaction


async def add_transaction(txn: NewTransaction, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""INSERT INTO transactions (bond_id, quantity, transaction_price, user_id, type)
                                    VALUES (%s, %s, %s, %s, %s)""", (txn.bond_id, txn.quantity, txn.transaction_price, txn.user_id, txn.type))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def get_user_transactions(user_id: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM transactions, bonds WHERE transactions.bond_id = bonds.bond_id AND user_id = %s 
                                    ORDER BY transaction_time DESC""", (user_id))
            transactions = await cursor.fetchall()
            print
        except Exception as err:
            print(err)

        await cursor.close()

    return transactions


async def get_broker_earnings(conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT SUM(transaction_price*quantity*0.01) AS earnings, COUNT(transaction_id) AS count
                                    FROM transactions WHERE 1""")
            earnings = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return earnings
