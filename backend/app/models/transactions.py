from pydantic import BaseModel, condecimal


class NewTransaction(BaseModel):
    bond_id: int
    quantity: int
    transaction_price: condecimal(max_digits=13, decimal_places=2)
    user_id: int
    type: str
