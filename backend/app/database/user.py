from ..models.user import User, UserKYC
from aiomysql.connection import Connection


async def user_login(user: User, conn: Connection) -> int:
    async with conn.cursor() as cursor:
        # add user if doesnt exist
        try:
            await cursor.execute("""INSERT INTO users (email) VALUES (%s)""", (user.email))
        except Exception as err:
            print(err)
        else:
            await conn.commit()

        # fetch user id
        await cursor.execute("""SELECT user_id, kyc_completed FROM users WHERE email = %s""", (user.email))
        user = await cursor.fetchone()

        await cursor.close()

    return user["user_id"], user["kyc_completed"]


async def add_user_data(user_id, name, contact_no, profile_photo, pan_card, bank_detail, address_proof, conn: Connection):
    async with conn.cursor() as cursor:
        try:
            await cursor.execute("""UPDATE users SET name = %s, contact_no = %s, profile_photo = %s, pan_card = %s, bank_detail = %s, 
                                    address_proof = %s WHERE user_id = %s""", (name, contact_no, profile_photo, pan_card,
                                                                               bank_detail, address_proof, user_id))

            await conn.commit()
        except Exception as err:
            print(err)

        await cursor.close()
