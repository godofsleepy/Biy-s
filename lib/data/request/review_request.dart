class ReviewRequest {
  String id;
  String name;
  String review;

  ReviewRequest({required this.id, required this.name, required this.review});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'review': review,
      };
}
