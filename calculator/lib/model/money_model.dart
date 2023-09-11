// To parse this JSON data, do
//
//     final excangeRate = excangeRateFromJson(jsonString);

import 'dart:convert';

ExcangeRate excangeRateFromJson(String str) => ExcangeRate.fromJson(json.decode(str));

String excangeRateToJson(ExcangeRate data) => json.encode(data.toJson());

class ExcangeRate {
    Usd? usd;

    ExcangeRate({
        this.usd,
    });

    factory ExcangeRate.fromJson(Map<String, dynamic> json) => ExcangeRate(
        usd: Usd.fromJson(json["USD"]),
    );

    Map<String, dynamic> toJson() => {
        "USD": usd?.toJson(),
    };
}

class Usd {
    String? satis;
    String? alis;
    String? degisim;
    String? dOran;
    String? dYon;


    Usd({
        this.satis,
        this.alis,
        this.degisim,
        this.dOran,
        this.dYon,
    });

    factory Usd.fromJson(Map<String, dynamic> json) => Usd(
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
