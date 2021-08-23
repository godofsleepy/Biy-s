import 'package:json_annotation/json_annotation.dart';

import 'package:biys/data/model/customer_review.dart';
import 'package:biys/data/model/detail_restaurant.dart';
import 'restaurant.dart';

part 'generate/base.g.dart';

@JsonSerializable()
class BaseRestaurants {
  bool? error;
  String? message;
  List<Restaurant>? restaurants;

  BaseRestaurants({
    this.error,
    this.message,
    this.restaurants,
  });

  factory BaseRestaurants.fromJson(Map<String, dynamic> json) =>
      _$BaseRestaurantsFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRestaurantsToJson(this);
}

@JsonSerializable()
class BaseRestaurant {
  bool? error;
  String? message;
  List<DetailRestaurant>? restaurants;

  BaseRestaurant({
    this.error,
    this.message,
    this.restaurants,
  });

  factory BaseRestaurant.fromJson(Map<String, dynamic> json) =>
      _$BaseRestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRestaurantToJson(this);
}

@JsonSerializable()
class BaseCustomerReviews<Restaurant> {
  bool? error;
  String? message;
  List<CustomerReview>? customerReviews;

  BaseCustomerReviews({
    this.error,
    this.message,
    this.customerReviews,
  });

  factory BaseCustomerReviews.fromJson(Map<String, dynamic> json) =>
      _$BaseCustomerReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$BaseCustomerReviewsToJson(this);
}
