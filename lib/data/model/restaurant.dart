import 'package:json_annotation/json_annotation.dart';

import 'menus.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return _$RestaurantFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
