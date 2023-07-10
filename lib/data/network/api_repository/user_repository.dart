
import 'package:api_default_project/models/products/products_model.dart';
import 'package:api_default_project/models/user/user_model.dart';

import '../../../models/universal_response.dart';
import '../api_provider.dart';

class UserRepository {
  final ApiProvider apiProvider;

  UserRepository({required this.apiProvider});

  Future<List<UserModel>> fetchUser() async {
    UniversalResponse universalResponse = await apiProvider.getAllUser();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<UserModel>;
    }
    return [];
  }
}