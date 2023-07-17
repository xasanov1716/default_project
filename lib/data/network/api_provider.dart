


import 'dart:convert';

import 'package:http/http.dart';

import '../models/display_models.dart';

class ApiProvider{

  Future getRobot() async {
    Response response = await get(Uri.parse('https://valorant-api.com/v1/agents'));
    if(response.statusCode==200){
      return Welcome.fromJson(jsonDecode(response.body));
    }
    throw Exception();
  }
}