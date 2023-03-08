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
        this.type,
        this.read
    });

    String? username;
    String? balance;
    DateTime? dateTime;
    String? type;
    bool? read;

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        username: json["username"],
        balance: json["balance"],
        dateTime: json["DateTime"],
        type:json["type"],
        read:json["read"]
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "balance": balance,
        "DateTime": dateTime,
        "type":type,
        "read":read,
    };
}
