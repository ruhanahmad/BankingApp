// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
    Account({
        this.BIC,
        this.IBAN,
        this.accountB,
        this.accountNumber,
        this.status,
        this.username,
        this.plan,
        this.limit,
        // this.dateTime,
    });

    String? BIC;
    String? IBAN;
    String? accountB;
    String? accountNumber;
    bool? status;
    String? username;
    String? plan;
    String? limit;
   

    factory Account.fromJson(DocumentSnapshot json) => Account(
        BIC: json["BIC"],
        IBAN: json["IBAN"],
        accountB: json["accountB"],
        accountNumber: json["accountNumber"],
        status: json["status"],
        username: json["username"],
        plan:json["plan"],
        limit:json["limit"],
     
        // dateTime: json["dateTime"]
    );

    Map<String, dynamic> toJson() => {
        "BIC": BIC,
        "IBAN": IBAN,
        "accountB": accountB,
        "accountNumber": accountNumber,
        "status": status,
        "username": username,
        "plan":plan,
        "limit":limit,
 
        // "dateTime":dateTime
    };
}
