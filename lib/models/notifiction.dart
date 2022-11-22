// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

Notifications notificationFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
    Notifications({
        this.username,
        this.balance,
        this.dateTime,
    });

    String? username;
    String? balance;
    DateTime? dateTime;

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        username: json["username"],
        balance: json["balance"],
        dateTime: json["DateTime"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "balance": balance,
        "DateTime": dateTime,
    };
}
