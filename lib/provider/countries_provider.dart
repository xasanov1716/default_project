import 'package:api_default_project/data/model/car_model.dart';
import 'package:api_default_project/data/model/model.dart';
import 'package:flutter/cupertino.dart';

import '../data/network/api_service.dart';

class CountryProvider with ChangeNotifier{


CountryProvider(){
  getCountry();
}

  bool isLoading = false;



  List<Country> countryModel = [];
  getCountry() async {
    notify(true);
    notifyListeners();
    countryModel = await ApiService.getCountry();
      notify(false);
      notifyListeners();
  }


notify(bool value){
  isLoading = value;
  notifyListeners();
}

}