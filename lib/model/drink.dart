import 'package:json_annotation/json_annotation.dart';

part 'generate/drink.g.dart';

@JsonSerializable()
class Drink {
  String? name;

  Drink({this.name});

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkToJson(this);
}
