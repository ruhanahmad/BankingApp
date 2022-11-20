// To parse this JSON data, do
//
//     final virtualCard = virtualCardFromJson(jsonString);

import 'dart:convert';

VirtualCard virtualCardFromJson(String str) => VirtualCard.fromJson(json.decode(str));

String virtualCardToJson(VirtualCard data) => json.encode(data.toJson());

class VirtualCard {
    VirtualCard({
        this.accountNumber,
        this.expiryDate,
        this.cvv,
        this.color,
        this.freeze,
    });

    String? accountNumber;
    DateTime? expiryDate;
    String? cvv;
    String? color;
    bool? freeze;

    factory VirtualCard.fromJson(Map<String, dynamic> json) => VirtualCard(
        accountNumber: json["accountNumber"],
        expiryDate: json["expiryDate"],
        cvv: json["cvv"],
        color: json["color"],
        freeze:json["freeze"],
    );

    Map<String, dynamic> toJson() => {
        "accountNumber": accountNumber,
        "expiryDate": expiryDate,
        "cvv": cvv,
        "color": color,
        "freeze":freeze,
    };
}
