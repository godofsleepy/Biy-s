import 'package:json_annotation/json_annotation.dart';

part 'customer_review.g.dart';

@JsonSerializable()
class CustomerReview {
  String? name;
  String? review;
  String? date;

  CustomerReview({this.name, this.review, this.date});

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return _$CustomerReviewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerReviewToJson(this);
}
