// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) => List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
    TransactionModel({
        required this.transactionId,
        required this.bondId,
        required this.transactionTime,
        required this.quantity,
        required this.transactionPrice,
        required this.userId,
        required this.type,
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

    int transactionId;
    int bondId;
    DateTime transactionTime;
    int quantity;
    double transactionPrice;
    int userId;
    Type type;
    int bondsBondId;
    Symbol symbol;
    Series series;
    BondType bondType;
    String open;
    String high;
    String low;
    String ltp;
    String close;
    double percentageChange;
    int qty;
    double value;
    double couponRate;
    CreditRating creditRating;
    String ratingAgency;
    int faceValue;
    String maturityDate;
    String bYield;
    String isin;
    String companyName;
    int isFeatured;
    DateTime releasedOn;

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        transactionId: json["transaction_id"],
        bondId: json["bond_id"],
        transactionTime: DateTime.parse(json["transaction_time"]),
        quantity: json["quantity"],
        transactionPrice: json["transaction_price"]?.toDouble(),
        userId: json["user_id"],
        type: typeValues.map[json["type"]]!,
        bondsBondId: json["bonds.bond_id"],
        symbol: symbolValues.map[json["Symbol"]]!,
        series: seriesValues.map[json["Series"]]!,
        bondType: bondTypeValues.map[json["BondType"]]!,
        open: json["Open"],
        high: json["High"],
        low: json["Low"],
        ltp: json["LTP"],
        close: json["Close"],
        percentageChange: json["PercentageChange"]?.toDouble(),
        qty: json["Qty"],
        value: json["Value"]?.toDouble(),
        couponRate: json["CouponRate"]?.toDouble(),
        creditRating: creditRatingValues.map[json["credit_rating"]]!,
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
        "transaction_id": transactionId,
        "bond_id": bondId,
        "transaction_time": transactionTime.toIso8601String(),
        "quantity": quantity,
        "transaction_price": transactionPrice,
        "user_id": userId,
        "type": typeValues.reverse[type],
        "bonds.bond_id": bondsBondId,
        "Symbol": symbolValues.reverse[symbol],
        "Series": seriesValues.reverse[series],
        "BondType": bondTypeValues.reverse[bondType],
        "Open": open,
        "High": high,
        "Low": low,
        "LTP": ltp,
        "Close": close,
        "PercentageChange": percentageChange,
        "Qty": qty,
        "Value": value,
        "CouponRate": couponRate,
        "credit_rating": creditRatingValues.reverse[creditRating],
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

enum BondType { REGULAR }

final bondTypeValues = EnumValues({
    "Regular": BondType.REGULAR
});

enum CreditRating { AAA, AA }

final creditRatingValues = EnumValues({
    "AA+": CreditRating.AA,
    "AAA": CreditRating.AAA
});

enum Series { N2, N6 }

final seriesValues = EnumValues({
    "N2": Series.N2,
    "N6": Series.N6
});

enum Symbol { NHAI, NHBTF2014, HUDCO }

final symbolValues = EnumValues({
    "HUDCO": Symbol.HUDCO,
    "NHAI": Symbol.NHAI,
    "NHBTF2014": Symbol.NHBTF2014
});

enum Type { BUY, SELL }

final typeValues = EnumValues({
    "BUY": Type.BUY,
    "SELL": Type.SELL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
