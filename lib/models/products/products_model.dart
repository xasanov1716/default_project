import 'package:api_default_project/models/products/raiting_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        category: json['category'] as String? ?? '',
        image: json['image'] as String? ?? '',
    );
  }
}
