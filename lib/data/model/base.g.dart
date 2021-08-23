// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRestaurants _$BaseRestaurantsFromJson(Map<String, dynamic> json) {
  return BaseRestaurants(
    error: json['error'] as bool?,
    message: json['message'] as String?,
    restaurants: (json['restaurants'] as List<dynamic>?)
        ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BaseRestaurantsToJson(BaseRestaurants instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'restaurants': instance.restaurants,
    };

BaseRestaurant _$BaseRestaurantFromJson(Map<String, dynamic> json) {
  return BaseRestaurant(
    error: json['error'] as bool?,
    message: json['message'] as String?,
    restaurant: json['restaurant'] == null
        ? null
        : DetailRestaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BaseRestaurantToJson(BaseRestaurant instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'restaurant': instance.restaurant,
    };

BaseCustomerReviews<Restaurant> _$BaseCustomerReviewsFromJson<Restaurant>(
    Map<String, dynamic> json) {
  return BaseCustomerReviews<Restaurant>(
    error: json['error'] as bool?,
    message: json['message'] as String?,
    customerReviews: (json['customerReviews'] as List<dynamic>?)
        ?.map((e) => CustomerReview.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BaseCustomerReviewsToJson<Restaurant>(
        BaseCustomerReviews<Restaurant> instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'customerReviews': instance.customerReviews,
    };
