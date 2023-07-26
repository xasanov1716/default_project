
import 'package:api_default_project/data/network/api_provider.dart';

import '../model/universal_data.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<UniversalData> getUser() =>
      apiProvider.getUsers();
}