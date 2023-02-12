from pydantic import BaseModel


class Waitlist(BaseModel):
    user_id: int
    bond_id: int
    quantity: int
    price: float
