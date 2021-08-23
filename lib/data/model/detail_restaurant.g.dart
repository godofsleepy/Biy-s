// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRestaurant _$DetailRestaurantFromJson(Map<String, dynamic> json) {
  return DetailRestaurant(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    city: json['city'] as String?,
    address: json['address'] as String?,
    pictureId: json['pictureId'] as String?,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
    menus: json['menus'] == null
        ? null
        : Menus.fromJson(json['menus'] as Map<String, dynamic>),
    rating: (json['rating'] as num?)?.toDouble(),
    customerReviews: (json['customerReviews'] as List<dynamic>?)
        ?.map((e) => CustomerReview.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DetailRestaurantToJson(DetailRestaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'city': instance.city,
      'address': instance.address,
      'pictureId': instance.pictureId,
      'categories': instance.categories,
      'menus': instance.menus,
      'rating': instance.rating,
      'customerReviews': instance.customerReviews,
    };
