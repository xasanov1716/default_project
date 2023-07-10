import 'package:api_default_project/models/user/auth_model.dart';
import 'package:api_default_project/models/user/location_model.dart';

class UserModel {
  final Location address;
  final int id;
  final String email;
  final String username;
  final String password;
  final Auth name;
  final String phone;
  final int v;

  UserModel(
      {required this.address,
      required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.name,
      required this.phone,
      required this.v});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        address: Location.fromJson(json['address']),
        id: json['id']as int? ?? 0,
        email: json['email']as String? ?? '',
        username: json['username']as String? ?? '',
        password: json['password']as String? ?? '',
        name: Auth.fromJson(json['name']),
        phone: json['phone']as String? ?? '',
        v: json['__v']as int? ?? 0);
  }
}
