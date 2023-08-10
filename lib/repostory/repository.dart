import 'dart:io';

import 'package:dio/dio.dart';

import '../model/dynamic_view_model.dart';

class MyRepository {
  Future<List<DynamicViewModel>> getDynamicFields() async {
    var dio = Dio();
    try {
      Response response =
          await dio.get("https://dynamic-view-api.free.mockoapp.net/views");

      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        return (response.data["dynamic_views"] as List?)
                ?.map((e) => DynamicViewModel.fromJson(e))
                .toList() ??
            [];
      }
      return [];
    } catch (error) {
      print(error);
      throw MyCustomFieldsError(errorText: error.toString());
    }
  }
}

class MyCustomFieldsError implements Exception {
  final String errorText;
  MyCustomFieldsError({required this.errorText});
}
