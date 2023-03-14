// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.username,
    required this.email,
    required this.createdAt,
  });


  String username;
  String email;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(

        username: json["username"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "created_at": createdAt.toIso8601String(),
      };
}
