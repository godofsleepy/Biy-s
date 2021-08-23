import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'customer_review.dart';
import 'menus.dart';

part 'generate/detail_restaurant.g.dart';

@JsonSerializable()
class DetailRestaurant {
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Category>? categories;
  Menus? menus;
  double? rating;
  List<CustomerReview>? customerReviews;

  DetailRestaurant({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) {
    return _$DetailRestaurantFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailRestaurantToJson(this);
}
