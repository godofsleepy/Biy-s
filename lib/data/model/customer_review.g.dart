// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) {
  return CustomerReview(
    name: json['name'] as String?,
    review: json['review'] as String?,
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$CustomerReviewToJson(CustomerReview instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };
