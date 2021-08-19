import 'package:json_annotation/json_annotation.dart';

import 'drink.dart';
import 'food.dart';

part 'generate/menus.g.dart';

@JsonSerializable()
class Menus {
  List<Food>? foods;
  List<Drink>? drinks;

  Menus({this.foods, this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);

  Map<String, dynamic> toJson() => _$MenusToJson(this);
}
