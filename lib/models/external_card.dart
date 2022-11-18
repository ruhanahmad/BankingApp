// To parse this JSON data, do
//
//     final exCard = exCardFromJson(jsonString);

import 'dart:convert';

ExCard exCardFromJson(String str) => ExCard.fromJson(json.decode(str));

String exCardToJson(ExCard data) => json.encode(data.toJson());

class ExCard {
    ExCard({
        this.cardNumber,
        this.date,
        this.cvv,
        this.balance,
    });

    String? cardNumber;
    String? date;
    String? cvv;
    String? balance;

    factory ExCard.fromJson(Map<String, dynamic> json) => ExCard(
        cardNumber: json["cardNumber"],
        date: json["date"],
        cvv: json["cvv"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "date": date,
        "cvv": cvv,
        "balance": balance,
    };
}
