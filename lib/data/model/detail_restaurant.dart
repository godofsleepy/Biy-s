import 'package:json_annotation/json_annotation.dart';
import 'category.dart';
import 'customer_review.dart';
import 'menus.dart';

@JsonSerializable()
class DetailRestaurant {
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Category>? categories;
  Menus? menus;
  double? rating;
  List<CustomerReview>? customerReviews;

  DetailRestaurant({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'city': city,
      'address': address,
      'pictureId': pictureId,
      'categories': categories?.map((x) => x.toJson()).toList(),
      'menus': menus?.toJson(),
      'rating': rating,
      'customerReviews': customerReviews?.map((x) => x.toJson()).toList(),
    };
  }

  factory DetailRestaurant.fromJson(Map<String, dynamic> map) {
    return DetailRestaurant(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      city: map['city'],
      address: map['address'],
      pictureId: map['pictureId'],
      categories: List<Category>.from(
          map['categories']?.map((x) => Category.fromJson(x))),
      menus: Menus.fromJson(map['menus']),
      rating: map['rating'].toDouble(),
      customerReviews: List<CustomerReview>.from(
          map['customerReviews']?.map((x) => CustomerReview.fromJson(x))),
    );
  }
}
