
import 'package:api_default_project/models/login/login_model.dart';
import 'package:api_default_project/models/products/products_model.dart';

import '../../../models/universal_response.dart';
import '../api_provider.dart';

class LoginRepository {
  final ApiProvider apiProvider;

  LoginRepository({required this.apiProvider});

  Future<List<LoginModel>> fetchLogin() async {
    UniversalResponse universalResponse = await apiProvider.getLogin();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<LoginModel>;
    }
    return [];
  }
}