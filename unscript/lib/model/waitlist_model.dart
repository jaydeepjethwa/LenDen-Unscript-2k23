
import 'dart:convert';

List<WaitlistModel> waitlistModelFromJson(String str) => List<WaitlistModel>.from(json.decode(str).map((x) => WaitlistModel.fromJson(x)));

String waitlistModelToJson(List<WaitlistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WaitlistModel {
    WaitlistModel({
        required this.waitId,
        required this.userId,
        required this.bondId,
        required this.quantity,
        required this.price,
        required this.joiningTime,
        required this.bondsBondId,
        required this.symbol,
        required this.series,
        required this.bondType,
        required this.open,
        required this.high,
        required this.low,
        required this.ltp,
        required this.close,
        required this.percentageChange,
        required this.qty,
        required this.value,
        required this.couponRate,
        required this.creditRating,
        required this.ratingAgency,
        required this.faceValue,
        required this.maturityDate,
        required this.bYield,
        required this.isin,
        required this.companyName,
        required this.isFeatured,
        required this.releasedOn,
    });

    int waitId;
    int userId;
    int bondId;
    int quantity;
    double price;
    DateTime joiningTime;
    int bondsBondId;
    String symbol;
    String series;
    String bondType;
    String open;
    String high;
    String low;
    String ltp;
    String close;
    double percentageChange;
    int qty;
    double value;
    double couponRate;
    String creditRating;
    String ratingAgency;
    int faceValue;
    String maturityDate;
    String bYield;
    String isin;
    String companyName;
    int isFeatured;
    DateTime releasedOn;

    factory WaitlistModel.fromJson(Map<String, dynamic> json) => WaitlistModel(
        waitId: json["wait_id"],
        userId: json["user_id"],
        bondId: json["bond_id"],
        quantity: json["quantity"],
        price: json["price"],
        joiningTime: DateTime.parse(json["joining_time"]),
        bondsBondId: json["bonds.bond_id"],
        symbol: json["Symbol"],
        series: json["Series"],
        bondType: json["BondType"],
        open: json["Open"],
        high: json["High"],
        low: json["Low"],
        ltp: json["LTP"],
        close: json["Close"],
        percentageChange: json["PercentageChange"]?.toDouble(),
        qty: json["Qty"],
        value: json["Value"]?.toDouble(),
        couponRate: json["CouponRate"]?.toDouble(),
        creditRating: json["credit_rating"],
        ratingAgency: json["rating_agency"],
        faceValue: json["face_value"],
        maturityDate: json["maturity_date"],
        bYield: json["bYield"],
        isin: json["isin"],
        companyName: json["companyName"],
        isFeatured: json["is_featured"],
        releasedOn: DateTime.parse(json["released_on"]),
    );

    Map<String, dynamic> toJson() => {
        "wait_id": waitId,
        "user_id": userId,
        "bond_id": bondId,
        "quantity": quantity,
        "price": price,
        "joining_time": joiningTime.toIso8601String(),
        "bonds.bond_id": bondsBondId,
        "Symbol": symbol,
        "Series": series,
        "BondType": bondType,
        "Open": open,
        "High": high,
        "Low": low,
        "LTP": ltp,
        "Close": close,
        "PercentageChange": percentageChange,
        "Qty": qty,
        "Value": value,
        "CouponRate": couponRate,
        "credit_rating": creditRating,
        "rating_agency": ratingAgency,
        "face_value": faceValue,
        "maturity_date": maturityDate,
        "bYield": bYield,
        "isin": isin,
        "companyName": companyName,
        "is_featured": isFeatured,
        "released_on": releasedOn.toIso8601String(),
    };
}
