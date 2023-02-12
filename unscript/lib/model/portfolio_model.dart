// To parse this JSON data, do
//
//     final portfolioModel = portfolioModelFromJson(jsonString);

import 'dart:convert';

PortfolioModel portfolioModelFromJson(String str) => PortfolioModel.fromJson(json.decode(str));

String portfolioModelToJson(PortfolioModel data) => json.encode(data.toJson());

class PortfolioModel {
    PortfolioModel({
        required this.stats,
        required this.bondsData,
    });

    Stats stats;
    List<BondsDatum> bondsData;

    factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
        stats: Stats.fromJson(json["stats"]),
        bondsData: List<BondsDatum>.from(json["bonds_data"].map((x) => BondsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "stats": stats.toJson(),
        "bonds_data": List<dynamic>.from(bondsData.map((x) => x.toJson())),
    };
}

class BondsDatum {
    BondsDatum({
        required this.portfolioId,
        required this.userId,
        required this.bondId,
        required this.quantity,
        required this.purchasePrice,
        required this.transactionTime,
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

    int portfolioId;
    int userId;
    int bondId;
    int quantity;
    double purchasePrice;
    DateTime transactionTime;
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

    factory BondsDatum.fromJson(Map<String, dynamic> json) => BondsDatum(
        portfolioId: json["portfolio_id"],
        userId: json["user_id"],
        bondId: json["bond_id"],
        quantity: json["quantity"],
        purchasePrice: json["purchase_price"]?.toDouble(),
        transactionTime: DateTime.parse(json["transaction_time"]),
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
        "portfolio_id": portfolioId,
        "user_id": userId,
        "bond_id": bondId,
        "quantity": quantity,
        "purchase_price": purchasePrice,
        "transaction_time": transactionTime.toIso8601String(),
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

class Stats {
    Stats({
        required this.noBonds,
        required this.totalQuantity,
        required this.totalAmount,
    });

    int noBonds;
    int totalQuantity;
    double totalAmount;

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        noBonds: json["no_bonds"],
        totalQuantity: json["total_quantity"],
        totalAmount: json["total_amount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "no_bonds": noBonds,
        "total_quantity": totalQuantity,
        "total_amount": totalAmount,
    };
}
