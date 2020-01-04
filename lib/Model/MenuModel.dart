import 'dart:convert';

import 'package:flutter/cupertino.dart';

class MenuModel {
  String title;
  String subtitle;
  Icon icon;
  String image;
  String routes;

  MenuModel({this.title, this.subtitle, this.icon, this.image, this.routes});

  factory MenuModel.fromRawJson(String str) =>
      MenuModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MenuModel.fromJson(Map<String, dynamic> json) => new MenuModel(
      title: json["title"],
      subtitle: json["subtitle"],
      icon: json["icon"],
      image: json["image"],
      routes: json["routes"]);

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "icon": icon,
    "image": image,
    "routes": routes
  };
}
