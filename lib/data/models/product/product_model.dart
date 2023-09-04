class ProductModel {
  final String id;
  final String name;
  final String image;
  final String status;
  final int yearBuilt;
  final List<dynamic> roles;

  ProductModel(
      {required this.id,
      required this.name,
      required this.yearBuilt,
      required this.image,
      required this.status,
      required this.roles});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String? ?? '',
      yearBuilt: json['year_built'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      status: json['status'] as String? ?? '',
      roles: json['roles'] as List? ?? []);
}
