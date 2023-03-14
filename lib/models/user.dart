// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.userId,
    required this.title,
  });

  int userId;
  String title;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
      };
}
