// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Base _$BaseFromJson(Map<String, dynamic> json) {
  return Base(
    restaurants: (json['restaurants'] as List<dynamic>?)
        ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BaseToJson(Base instance) => <String, dynamic>{
      'restaurants': instance.restaurants,
    };
