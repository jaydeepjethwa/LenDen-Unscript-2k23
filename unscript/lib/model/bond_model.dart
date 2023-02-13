// To parse this JSON data, do
//
//     final bondModel = bondModelFromJson(jsonString);

import 'dart:convert';

List<BondModel> bondModelFromJson(String str) => List<BondModel>.from(json.decode(str).map((x) => BondModel.fromJson(x)));

String bondModelToJson(List<BondModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BondModel {
    BondModel({
        required this.bondId,
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
    });

    int bondId;
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

    factory BondModel.fromJson(Map<String, dynamic> json) => BondModel(
        bondId: json["bond_id"],
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
    );

    Map<String, dynamic> toJson() => {
        "bond_id": bondId,
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
    };
}

