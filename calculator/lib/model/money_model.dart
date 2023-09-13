// To parse this JSON data, do
//
//     final excangeRate = excangeRateFromJson(jsonString);

import 'dart:convert';

ExcangeRate excangeRateFromJson(String str) => ExcangeRate.fromJson(json.decode(str));

String excangeRateToJson(ExcangeRate data) => json.encode(data.toJson());

class ExcangeRate {
    Btc? usd;
    Btc? eur;
    Btc? gbp;
    Btc? ga;
    Btc? c;
    Btc? gag;
    Btc? btc;
    Btc? eth;
    Xu100? xu100;

    ExcangeRate({
        this.usd,
        this.eur,
        this.gbp,
        this.ga,
        this.c,
        this.gag,
        this.btc,
        this.eth,
        this.xu100,
    });

    factory ExcangeRate.fromJson(Map<String, dynamic> json) => ExcangeRate(
        usd: Btc.fromJson(json["USD"]),
        eur: Btc.fromJson(json["EUR"]),
        gbp: Btc.fromJson(json["GBP"]),
        ga: Btc.fromJson(json["GA"]),
        c: Btc.fromJson(json["C"]),
        gag: Btc.fromJson(json["GAG"]),
        btc: Btc.fromJson(json["BTC"]),
        eth: Btc.fromJson(json["ETH"]),
        xu100: Xu100.fromJson(json["XU100"]),
    );

    Map<String, dynamic> toJson() => {
        "USD": usd?.toJson(),
        "EUR": eur?.toJson(),
        "GBP": gbp?.toJson(),
        "GA": ga?.toJson(),
        "C": c?.toJson(),
        "GAG": gag?.toJson(),
        "BTC": btc?.toJson(),
        "ETH": eth?.toJson(),
        "XU100": xu100?.toJson(),
    };
}

class Btc {
    String? satis;
    String? alis;
    String? degisim;
    String? dOran;
    String? dYon;

    Btc({
        this.satis,
        this.alis,
        this.degisim,
        this.dOran,
        this.dYon,
    });

    factory Btc.fromJson(Map<String, dynamic> json) => Btc(
        satis: json["satis"],
        alis: json["alis"],
        degisim: json["degisim"],
        dOran: json["d_oran"],
        dYon: json["d_yon"],
    );

    Map<String, dynamic> toJson() => {
        "satis": satis,
        "alis": alis,
        "degisim": degisim,
        "d_oran": dOran,
        "d_yon": dYon,
    };
}

class Xu100 {
    String? satis;
    String? alis;
    String? degisim;

    Xu100({
        this.satis,
        this.alis,
        this.degisim,
    });

    factory Xu100.fromJson(Map<String, dynamic> json) => Xu100(
        satis: json["satis"],
        alis: json["alis"],
        degisim: json["degisim"],
    );

    Map<String, dynamic> toJson() => {
        "satis": satis,
        "alis": alis,
        "degisim": degisim,
    };
}
