import 'package:api_default_project/data/model/car_item.dart';
import 'package:api_default_project/data/model/car_model.dart';
import 'package:api_default_project/ui/tab_box/car_item_screen/car_item.dart';
import 'package:flutter/cupertino.dart';

import '../data/network/api_service.dart';

class CarItemProvider with ChangeNotifier{


  CarItemProvider(){
    getCarItem();
  }


  bool isLoading = false;

  CarItem? carsModel;
  getCarItem() async {
    notify(true);
    notifyListeners();
    carsModel = await ApiService.getCarItem();
    notify(false);
      notifyListeners();
  }


  notify(bool value){
    isLoading = value;
    notifyListeners();
  }
}