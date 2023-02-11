from pydantic import BaseModel, EmailStr


class User(BaseModel):
    email: EmailStr


class UserKYC(BaseModel):
    user_id: int
    name: str
    contact_no: str
