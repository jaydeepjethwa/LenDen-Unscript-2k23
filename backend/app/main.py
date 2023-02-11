from fastapi import FastAPI
from .database import Database
from .routes import auth_router, user_router

app = FastAPI()


@app.on_event("startup")
async def startup():
    await Database.establish_db_connection()


@app.on_event("shutdown")
async def shutdown():
    await Database.close_db_connection()


@app.get("/")
async def main():
    return "Welcome to 'LenDen', Bond Trade Simplified."


app.include_router(auth_router, tags=["Authentication"], prefix="/auth")
app.include_router(user_router, tags=["Users"], prefix="/user")
