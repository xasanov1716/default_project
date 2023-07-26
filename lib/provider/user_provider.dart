import 'package:api_default_project/data/model/universal_data.dart';
import 'package:api_default_project/data/model/user_model.dart';
import 'package:api_default_project/data/network/user_repository.dart';
import 'package:flutter/foundation.dart';

import '../data/model/status/form_status.dart';

class UserProvider with ChangeNotifier {
  final UserRepository userRepository;

  UserProvider({required this.userRepository}){
    fetchUsersData();
  }

  String errorText = "";

  FormStatus status = FormStatus.pure;

  List<User>? users;

  fetchUsersData() async {
    notify(FormStatus.loading);
    UniversalData universalData = await userRepository.getUser();
    if (universalData.error.isEmpty) {
      notify(FormStatus.success);
      users = universalData.data as List<User>;
    } else {
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value) {
    status = value;
    notifyListeners();
  }
}