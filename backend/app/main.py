from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .database import Database
from .routes import auth_router, user_router, bond_router, txn_router, portfolio_router, waitlist_router

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


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
app.include_router(bond_router, tags=["Bonds"], prefix="/bond")
app.include_router(txn_router, tags=["Transactions"], prefix="/transactions")
app.include_router(portfolio_router, tags=["Portfolio"], prefix="/portfolio")
app.include_router(waitlist_router, tags=["Waitlist"], prefix="/waitlist")
