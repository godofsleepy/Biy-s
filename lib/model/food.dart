import 'package:json_annotation/json_annotation.dart';

part 'generate/food.g.dart';

@JsonSerializable()
class Food {
  String? name;

  Food({this.name});

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
