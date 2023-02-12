from ..models.users import User, UserKYC
from aiomysql.connection import Connection


async def user_login(user: User, conn: Connection) -> int:
    async with conn.cursor() as cursor:
        # add user if doesnt exist
        try:
            await cursor.execute("""INSERT INTO users (email) VALUES (%s)""", (user.email))
            await conn.commit()
        except Exception as err:
            print(err)

        # fetch user id
        try:
            await cursor.execute("""SELECT user_id FROM users WHERE email = %s""", (user.email))
            user = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return user["user_id"]


async def get_all_user_details(conn):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM users""")
            user_details = await cursor.fetchall()
        except Exception as err:
            print(err)

        await cursor.close()

    return user_details


async def get_user_details(user_id: str, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT * FROM users WHERE user_id = %s""", (user_id))
            user_details = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return user_details


async def add_user_data(user: UserKYC, profile_photo, pan_card, bank_detail, address_proof, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE users SET name = %s, contact_no = %s, profile_photo = %s, pan_card = %s, bank_detail = %s, 
                                    address_proof = %s WHERE user_id = %s""", (user.name, user.contact_no, profile_photo, pan_card,
                                                                               bank_detail, address_proof, user.user_id))

            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def get_verification_count(conn: Connection, status: int):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT COUNT(user_id) FROM users WHERE kyc_completed = %s""", (status))
            count = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return count["COUNT(user_id)"]


async def get_kyc_status(user_id: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT name, kyc_completed FROM users WHERE user_id = %s""", (user_id))
            user_status = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return user_status


async def update_kyc_status(user_id: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE users SET kyc_completed = TRUE WHERE user_id = %s""", (user_id))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def deposit_to_wallet(user_id: int, amount: float, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE users SET wallet = wallet+%s WHERE user_id = %s""", (amount, user_id))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def debit_from_wallet(user_id: int, amount: float, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE users SET wallet = wallet-%s WHERE user_id = %s""", (amount, user_id))
            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()


async def get_wallet_balance(user_id: int, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""SELECT wallet AS balance FROM users WHERE user_id = %s""", (user_id))
            balance = await cursor.fetchone()
        except Exception as err:
            print(err)

        await cursor.close()

    return balance
