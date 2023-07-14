
import '../../local/storage_repository.dart';
import '../../models/universal_model.dart';
import '../../models/user/user_model.dart';
import '../providers/api_provider.dart';

class UserRepo {
  UserRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<UserModel>> getAllUsers() async {
    UniversalResponse universalResponse = await apiProvider.getAllUsers();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<UserModel>;
    }
    return [];
  }

  Future<void> logOutUser() async {
    await StorageRepository.deleteString("token");
  }
}
