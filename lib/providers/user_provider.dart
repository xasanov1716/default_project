import 'package:api_default_project/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../data/network/api_provider.dart';

class UserProvider with ChangeNotifier{


  bool isLoading = false;
  Welcome? welcome;

  void getMyData()async{
    isLoading = true;
    welcome = await ApiProvider.getData();
    isLoading = false;
    notifyListeners();
  }

}