import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bnacash/main.dart';



// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
      this.firebaseId,
        this.fullName,
        this.country,
       this.address,
       this.email,this.occupation,
       this.dob,
       this.idCard,
       this.Passport,
       this.AccountDetail,
       this.accountBalance,
       this.passcode,

    });
    String? passcode;
    String? firebaseId;
    String? fullName;
    String? country;
    String? address;
    String? occupation;
    String? email;
    String? dob;
    String? idCard;
    String? Passport;
    String? AccountDetail;
    String? accountBalance ;

    factory Welcome.fromJson(DocumentSnapshot json) => Welcome(
        passcode: json["passcode"],
        firebaseId: json["firebaseID"],
        fullName: json["name"],
        country: json["country"],
        address: json["address"],
        email:json["email"],
        occupation: json["occupation"],
        dob: json["dob"],
        idCard: json["idCard"],
        Passport: json["Passport"],
        AccountDetail: json["AccountDetail"],
        accountBalance: json["accountBalance"],


   );

    Map<String, dynamic> toJson() => {
        "firebaseID": firebaseId,
        "name": fullName,
        "country": country,
        "address": address,
        "email":email,
        "occupation":occupation,
        "dob":dob,
        "idCard":idCard,
        "Passport":Passport,
        "AccountDetail":AccountDetail,
        "AccountBalance":accountBalance,
        "passcode":passcode,
    };
}
