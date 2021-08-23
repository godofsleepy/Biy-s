import 'package:json_annotation/json_annotation.dart';

import 'food.dart';

part 'menus.g.dart';

@JsonSerializable()
class Menus {
  List<Food>? foods;
  List<Food>? drinks;

  Menus({this.foods, this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);

  Map<String, dynamic> toJson() => _$MenusToJson(this);
}
