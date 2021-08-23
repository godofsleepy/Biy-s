import 'package:json_annotation/json_annotation.dart';

part 'generate/category.g.dart';

@JsonSerializable()
class Category {
  String? name;

  Category({this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
