import 'dart:convert';

import 'package:api_default_project/data/models/prayer_info_models.dart';
import 'package:api_default_project/data/models/prayer_times_models.dart';

import 'package:http/http.dart' as http;

class ApiProvider {
  Future<PrayerInfoModel> getPrayer() async {
    final response = await http
        .get(Uri.parse('https://islomapi.uz/api/present/day?region=Toshkent'));
    if (response.statusCode == 200) {
      return PrayerInfoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ERRORR!!!!!');
    }
  }
}