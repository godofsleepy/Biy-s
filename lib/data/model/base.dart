import 'package:json_annotation/json_annotation.dart';

import 'restaurant.dart';

part 'generate/base.g.dart';

@JsonSerializable()
class Base {
  List<Restaurant>? restaurants;

  Base({this.restaurants});

  factory Base.fromJson(Map<String, dynamic> json) => _$BaseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseToJson(this);
}
