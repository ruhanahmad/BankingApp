// To parse this JSON data, do
//
//     final contacts = contactsFromJson(jsonString);

import 'dart:convert';

Contacts contactsFromJson(String str) => Contacts.fromJson(json.decode(str));

String contactsToJson(Contacts data) => json.encode(data.toJson());

class Contacts {
    Contacts({
        this.id,
      
        this.name,
        this.email,
        this.iban,
    });

    String? id;
    
    String? name;
    String? email;
    String? iban;

    factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        id: json["id"],
       
        name: json["name"],
        email: json["Email"],
        iban: json["iban"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
      
        "name": name,
        "Email": email,
        "iban": iban,
    };
}
