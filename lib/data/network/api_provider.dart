import 'dart:convert';

import 'package:http/http.dart';

import '../models/user_model.dart';

class ApiProvider{
  static Future getData()async{

    Response response = await get(Uri.parse("https://randomuser.me/api/"));
    if(response.statusCode==200){
      return Welcome.fromJson(jsonDecode(response.body));
    }

  }
}