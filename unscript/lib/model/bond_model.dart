import 'dart:convert';

BondModel bondModelFromJson(String str) => BondModel.fromJson(json.decode(str));

String bondModelToJson(BondModel data) => json.encode(data.toJson());

class BondModel {
    BondModel({
        required this.dec,
        required this.adv,
        required this.noChg,
        required this.timeStamp,
        required this.data,
        required this.filters,
        required this.totalTradedValue,
        required this.totalTradedVolume,
        required this.marketStatus,
    });

    int dec;
    int adv;
    int noChg;
    String timeStamp;
    List<Datum> data;
    List<String> filters;
    double totalTradedValue;
    int totalTradedVolume;
    MarketStatus marketStatus;

    factory BondModel.fromJson(Map<String, dynamic> json) => BondModel(
        dec: json["dec"],
        adv: json["adv"],
        noChg: json["noChg"],
        timeStamp: json["timeStamp"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        filters: List<String>.from(json["filters"].map((x) => x)),
        totalTradedValue: json["totalTradedValue"]?.toDouble(),
        totalTradedVolume: json["totalTradedVolume"],
        marketStatus: MarketStatus.fromJson(json["marketStatus"]),
    );

    Map<String, dynamic> toJson() => {
        "dec": dec,
        "adv": adv,
        "noChg": noChg,
        "timeStamp": timeStamp,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "filters": List<dynamic>.from(filters.map((x) => x)),
        "totalTradedValue": totalTradedValue,
        "totalTradedVolume": totalTradedVolume,
        "marketStatus": marketStatus.toJson(),
    };
}

class Datum {
    Datum({
        required this.symbol,
        required this.series,
        this.bondType,
        required this.open,
        required this.high,
        required this.low,
        this.ltP,
        required this.close,
        this.per,
        required this.qty,
        required this.trdVal,
        this.coupr,
        this.creditRating,
        this.ratingAgency,
        this.faceValue,
        required this.nxtipDate,
        required this.maturityDate,
        required this.bYield,
        this.isin,
        required this.meta,
    });

    String symbol;
    Series series;
    BondType? bondType;
    String open;
    String high;
    String low;
    String? ltP;
    String close;
    String? per;
    String qty;
    String trdVal;
    String? coupr;
    String? creditRating;
    String? ratingAgency;
    String? faceValue;
    NxtipDate nxtipDate;
    String maturityDate;
    String bYield;
    String? isin;
    Meta meta;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        symbol: json["symbol"],
        series: seriesValues.map[json["series"]]!,
        bondType: bondTypeValues.map[json["bond_type"]]!,
        open: json["open"],
        high: json["high"],
        low: json["low"],
        ltP: json["ltP"],
        close: json["close"],
        per: json["per"],
        qty: json["qty"],
        trdVal: json["trdVal"],
        coupr: json["coupr"],
        creditRating: json["credit_rating"],
        ratingAgency: json["rating_agency"],
        faceValue: json["face_value"],
        nxtipDate: nxtipDateValues.map[json["nxtip_date"]]!,
        maturityDate: json["maturity_date"],
        bYield: json["bYield"],
        isin: json["isin"],
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "series": seriesValues.reverse[series],
        "bond_type": bondTypeValues.reverse[bondType],
        "open": open,
        "high": high,
        "low": low,
        "ltP": ltP,
        "close": close,
        "per": per,
        "qty": qty,
        "trdVal": trdVal,
        "coupr": coupr,
        "credit_rating": creditRating,
        "rating_agency": ratingAgency,
        "face_value": faceValue,
        "nxtip_date": nxtipDateValues.reverse[nxtipDate],
        "maturity_date": maturityDate,
        "bYield": bYield,
        "isin": isin,
        "meta": meta.toJson(),
    };
}

enum BondType { REGULAR }

final bondTypeValues = EnumValues({
    "Regular": BondType.REGULAR
});

class Meta {
    Meta({
        this.symbol,
        this.companyName,
        this.activeSeries,
        this.debtSeries,
        this.tempSuspendedSeries,
        this.isFnoSec,
        this.isCaSec,
        this.isSlbSec,
        this.isDebtSec,
        this.isSuspended,
        this.isEtfSec,
        this.isDelisted,
        this.isin,
        this.industry,
        this.data,
        this.msg,
    });

    String? symbol;
    String? companyName;
    List<ActiveSery>? activeSeries;
    List<Series>? debtSeries;
    List<Series>? tempSuspendedSeries;
    bool? isFnoSec;
    bool? isCaSec;
    bool? isSlbSec;
    bool? isDebtSec;
    bool? isSuspended;
    bool? isEtfSec;
    bool? isDelisted;
    String? isin;
    Industry? industry;
    List<dynamic>? data;
    String? msg;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        symbol: json["symbol"],
        companyName: json["companyName"],
        activeSeries: json["activeSeries"] == null ? [] : List<ActiveSery>.from(json["activeSeries"]!.map((x) => activeSeryValues.map[x]!)),
        debtSeries: json["debtSeries"] == null ? [] : List<Series>.from(json["debtSeries"]!.map((x) => seriesValues.map[x]!)),
        tempSuspendedSeries: json["tempSuspendedSeries"] == null ? [] : List<Series>.from(json["tempSuspendedSeries"]!.map((x) => seriesValues.map[x]!)),
        isFnoSec: json["isFNOSec"],
        isCaSec: json["isCASec"],
        isSlbSec: json["isSLBSec"],
        isDebtSec: json["isDebtSec"],
        isSuspended: json["isSuspended"],
        isEtfSec: json["isETFSec"],
        isDelisted: json["isDelisted"],
        isin: json["isin"],
        industry: industryValues.map[json["industry"]]!,
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "companyName": companyName,
        "activeSeries": activeSeries == null ? [] : List<dynamic>.from(activeSeries!.map((x) => activeSeryValues.reverse[x])),
        "debtSeries": debtSeries == null ? [] : List<dynamic>.from(debtSeries!.map((x) => seriesValues.reverse[x])),
        "tempSuspendedSeries": tempSuspendedSeries == null ? [] : List<dynamic>.from(tempSuspendedSeries!.map((x) => seriesValues.reverse[x])),
        "isFNOSec": isFnoSec,
        "isCASec": isCaSec,
        "isSLBSec": isSlbSec,
        "isDebtSec": isDebtSec,
        "isSuspended": isSuspended,
        "isETFSec": isEtfSec,
        "isDelisted": isDelisted,
        "isin": isin,
        "industry": industryValues.reverse[industry],
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "msg": msg,
    };
}

enum ActiveSery { EQ, IV }

final activeSeryValues = EnumValues({
    "EQ": ActiveSery.EQ,
    "IV": ActiveSery.IV
});

enum Series { N2, N3, N4, N5, N6, N7, N8, N9, NA, NB, NC, ND, NE, NF, NG, N1, NH, NI, NJ, NK, NL, NM, NN, NO, NP, NQ, NR, NS, NT, NU, NV, NW, NX, NY, NZ, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, YH, YI, YK, YL, YN, YO, YP, YR, YS, YU, YV, YW, YY, YZ, Z2, Z4, Z5, Z8, Z9, ZB, ZC, ZE, ZF, ZH, ZI, ZK, N0, YA, YB, YC, YD, YG, YJ, YM, YQ, YT, YX, Z1, Z3, Z6, Z7, ZA, ZD, ZG, ZJ, ZL, ZN, ZQ, ZR, ZW, ZZ, EQ, U1, U2, U3, U4, U5, IL, BE, U6, U7, U8, K1, W1 }

final seriesValues = EnumValues({
    "BE": Series.BE,
    "EQ": Series.EQ,
    "IL": Series.IL,
    "K1": Series.K1,
    "N0": Series.N0,
    "N1": Series.N1,
    "N2": Series.N2,
    "N3": Series.N3,
    "N4": Series.N4,
    "N5": Series.N5,
    "N6": Series.N6,
    "N7": Series.N7,
    "N8": Series.N8,
    "N9": Series.N9,
    "NA": Series.NA,
    "NB": Series.NB,
    "NC": Series.NC,
    "ND": Series.ND,
    "NE": Series.NE,
    "NF": Series.NF,
    "NG": Series.NG,
    "NH": Series.NH,
    "NI": Series.NI,
    "NJ": Series.NJ,
    "NK": Series.NK,
    "NL": Series.NL,
    "NM": Series.NM,
    "NN": Series.NN,
    "NO": Series.NO,
    "NP": Series.NP,
    "NQ": Series.NQ,
    "NR": Series.NR,
    "NS": Series.NS,
    "NT": Series.NT,
    "NU": Series.NU,
    "NV": Series.NV,
    "NW": Series.NW,
    "NX": Series.NX,
    "NY": Series.NY,
    "NZ": Series.NZ,
    "U1": Series.U1,
    "U2": Series.U2,
    "U3": Series.U3,
    "U4": Series.U4,
    "U5": Series.U5,
    "U6": Series.U6,
    "U7": Series.U7,
    "U8": Series.U8,
    "W1": Series.W1,
    "Y1": Series.Y1,
    "Y2": Series.Y2,
    "Y3": Series.Y3,
    "Y4": Series.Y4,
    "Y5": Series.Y5,
    "Y6": Series.Y6,
    "Y7": Series.Y7,
    "Y8": Series.Y8,
    "Y9": Series.Y9,
    "YA": Series.YA,
    "YB": Series.YB,
    "YC": Series.YC,
    "YD": Series.YD,
    "YG": Series.YG,
    "YH": Series.YH,
    "YI": Series.YI,
    "YJ": Series.YJ,
    "YK": Series.YK,
    "YL": Series.YL,
    "YM": Series.YM,
    "YN": Series.YN,
    "YO": Series.YO,
    "YP": Series.YP,
    "YQ": Series.YQ,
    "YR": Series.YR,
    "YS": Series.YS,
    "YT": Series.YT,
    "YU": Series.YU,
    "YV": Series.YV,
    "YW": Series.YW,
    "YX": Series.YX,
    "YY": Series.YY,
    "YZ": Series.YZ,
    "Z1": Series.Z1,
    "Z2": Series.Z2,
    "Z3": Series.Z3,
    "Z4": Series.Z4,
    "Z5": Series.Z5,
    "Z6": Series.Z6,
    "Z7": Series.Z7,
    "Z8": Series.Z8,
    "Z9": Series.Z9,
    "ZA": Series.ZA,
    "ZB": Series.ZB,
    "ZC": Series.ZC,
    "ZD": Series.ZD,
    "ZE": Series.ZE,
    "ZF": Series.ZF,
    "ZG": Series.ZG,
    "ZH": Series.ZH,
    "ZI": Series.ZI,
    "ZJ": Series.ZJ,
    "ZK": Series.ZK,
    "ZL": Series.ZL,
    "ZN": Series.ZN,
    "ZQ": Series.ZQ,
    "ZR": Series.ZR,
    "ZW": Series.ZW,
    "ZZ": Series.ZZ
});

enum Industry { FINANCIAL_INSTITUTION, FINANCE, FOOD_AND_FOOD_PROCESSING, POWER, FINANCE_HOUSING }

final industryValues = EnumValues({
    "FINANCE": Industry.FINANCE,
    "FINANCE - HOUSING": Industry.FINANCE_HOUSING,
    "FINANCIAL INSTITUTION": Industry.FINANCIAL_INSTITUTION,
    "FOOD AND FOOD PROCESSING": Industry.FOOD_AND_FOOD_PROCESSING,
    "POWER": Industry.POWER
});

enum NxtipDate { EMPTY }

final nxtipDateValues = EnumValues({
    "-": NxtipDate.EMPTY
});

class MarketStatus {
    MarketStatus({
        required this.market,
        required this.marketStatus,
        required this.tradeDate,
        required this.index,
        required this.last,
        required this.variation,
        required this.percentChange,
        required this.marketStatusMessage,
    });

    String market;
    String marketStatus;
    String tradeDate;
    String index;
    double last;
    double variation;
    double percentChange;
    String marketStatusMessage;

    factory MarketStatus.fromJson(Map<String, dynamic> json) => MarketStatus(
        market: json["market"],
        marketStatus: json["marketStatus"],
        tradeDate: json["tradeDate"],
        index: json["index"],
        last: json["last"]?.toDouble(),
        variation: json["variation"]?.toDouble(),
        percentChange: json["percentChange"]?.toDouble(),
        marketStatusMessage: json["marketStatusMessage"],
    );

    Map<String, dynamic> toJson() => {
        "market": market,
        "marketStatus": marketStatus,
        "tradeDate": tradeDate,
        "index": index,
        "last": last,
        "variation": variation,
        "percentChange": percentChange,
        "marketStatusMessage": marketStatusMessage,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
