import 'package:api_default_project/data/models/user_model.dart';
import 'package:api_default_project/data/network/api_provider.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {

  bool isLoading = false;

  Welcome? _person;

  Welcome? get person => _person;

  void getPerson() async {
    changeLoading();
    _person = await ApiProvider.getData();
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}