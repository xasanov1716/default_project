import 'package:api_default_project/data/model/car_model.dart';
import 'package:flutter/cupertino.dart';

import '../data/network/api_service.dart';

class CarProvider with ChangeNotifier{


 CarProvider(){
   getCar();
 }

  bool isLoading = false;

  List<CarsModel> cars = [];
  getCar() async {
      notify(true);
      notifyListeners();
    cars = await ApiService.getAllCars();
      notify(false);
      notifyListeners();
  }


  notify(bool value){
    isLoading = value;
    notifyListeners();
  }


}