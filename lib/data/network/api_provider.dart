import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/card_model.dart';
import '../../models/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> getAllCard() async {
    Uri uri = Uri.parse("https://banking-api.free.mockoapp.net/user_cards");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => BankModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }
}