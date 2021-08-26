import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'food.dart';

@JsonSerializable()
class Menus {
  List<Food>? foods;
  List<Food>? drinks;

  Menus({this.foods, this.drinks});

  Map<String, dynamic> toJson() {
    return {
      'foods': foods?.map((x) => x.toJson()).toList(),
      'drinks': drinks?.map((x) => x.toJson()).toList(),
    };
  }

  factory Menus.fromJson(Map<String, dynamic> map) {
    return Menus(
      foods: List<Food>.from(map['foods']?.map((x) => Food.fromJson(x))),
      drinks: List<Food>.from(map['drinks']?.map((x) => Food.fromJson(x))),
    );
  }
}
