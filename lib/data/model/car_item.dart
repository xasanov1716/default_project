// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

CarItem emptyFromJson(String str) => CarItem.fromJson(json.decode(str));

String emptyToJson(CarItem data) => json.encode(data.toJson());

class CarItem {
  int id;
  String carModel;
  String logo;
  int establishedYear;
  int averagePrice;
  String description;
  List<String> carPics;

  CarItem({
    required this.id,
    required this.carModel,
    required this.logo,
    required this.establishedYear,
    required this.averagePrice,
    required this.description,
    required this.carPics,
  });

  factory CarItem.fromJson(Map<String, dynamic> json) => CarItem(
    id: json["id"],
    carModel: json["car_model"],
    logo: json["logo"],
    establishedYear: json["established_year"],
    averagePrice: json["average_price"],
    description: json["description"],
    carPics: List<String>.from(json["car_pics"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "logo": logo,
    "established_year": establishedYear,
    "average_price": averagePrice,
    "description": description,
    "car_pics": List<dynamic>.from(carPics.map((x) => x)),
  };
}