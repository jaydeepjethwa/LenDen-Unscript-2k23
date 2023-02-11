# sign, encode, decode and return jwts
import time
import jwt
from decouple import config

JWT_SECRET = config("JWT_SECRET")
JWT_ALGORITHM = config("JWT_ALGORITHM")


# sign jwt token
def signJWT(userID: str):
    payload = {
        "userID": userID,
        "expires": time.time() + 2400
    }
    token = jwt.encode(payload, JWT_SECRET, JWT_ALGORITHM)

    return token


def decodeJWT(token: str):
    try:
        decoded_token = jwt.decode(token, JWT_SECRET, JWT_ALGORITHM)
        return decoded_token if decoded_token["expires"] >= time.time() else None
    except:
        return {}
