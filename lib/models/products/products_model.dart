import 'package:api_default_project/models/products/raiting_model.dart';

class ProductModel {
  final num id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  ProductModel(
      {required this.id,
        required this.title,
        required this.price,
        required this.category,
        required this.description,
        this.rating,
        required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"] as num? ?? 0,
        title: json["title"] as String? ?? "",
        price: json["price"] as num? ?? 0,
        category: json["category"] as String? ?? "",
        description: json["description"] as String? ?? "",
        rating: Rating.fromJson(json["rating"]),
        image: json["image"] as String? ?? "");
  }

}

