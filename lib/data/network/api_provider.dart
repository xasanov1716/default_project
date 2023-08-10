import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/car_item.dart';
import '../model/car_model.dart';
import '../model/model.dart';
import '../universal_data.dart';

class ApiService {
  // DIO SETTINGS

  final dio = Dio();

  ApiService() {
    _init();
  }

  _init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          //error.response.statusCode
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV  YUBORILDI :${handler.isCompleted}");
          // return handler.resolve(Response(requestOptions: requestOptions, data: {"name": "ali", "age": 26}));
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB  KELDI :${handler.isCompleted}");
          return handler.next(response);
        },
      ),
    );
  }

  static Future getCountry()async{
    final dio = Dio();
    Response response;
    try{
      response = await dio.get("https://easyenglishuzb.free.mockoapp.net/countries");
      if(response.statusCode==200){
        return CountryData.fromJson(response.data);
      }
      return UniversalData(error: "Other Error");
    }on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future getCarItem()async{

    Random random = Random();

    final dio = Dio();
    Response response;
    try{
      response = await dio.get("https://easyenglishuzb.free.mockoapp.net/companies/${random.nextInt(7)+1}");
      if(response.statusCode==200){
        return CarItem.fromJson(response.data);
      }
      return UniversalData(error: "Other Error");
    }on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }


  static Future getAllCars()async{
    final dio = Dio();
    Response response;
    try{
      response = await dio.get("https://easyenglishuzb.free.mockoapp.net/companies");
      if(response.statusCode==200){
        return CarsModel.fromJson(response.data);
      }
      return UniversalData(error: "Other Error");
    }on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

}