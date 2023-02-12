from pydantic import BaseModel


class Bond(BaseModel):
    Symbol: str
    Series: str
    BondType: str
    Open: str
    High: str
    Low: str
    LTP: str
    Close: str
    PercentageChange: float
    Qty: int
    Value: float
    CouponRate: float
    credit_rating: str
    rating_agency: str
    face_value: int
    maturity_date: str
    bYield: str
    isin: str
    companyName: str
