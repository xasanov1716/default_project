import 'dart:convert';

import 'package:api_default_project/data/models/prayer_info_models.dart';
import 'package:api_default_project/data/models/prayer_times_models.dart';
import 'package:api_default_project/data/network/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

ApiProvider apiProvider = ApiProvider();

  late PrayerInfoModel prayer;
class _OnBoardingState extends State<OnBoarding> {

  void fetPrayer() async {
    final response = await http.get(Uri.parse('https://islomapi.uz/api/present/day?region=Toshkent'));
    if (response.statusCode == 200) {
      prayer =  PrayerInfoModel.fromJson(jsonDecode(response.body));
    }
  }


  @override
  void initState() {
    fetPrayer();
    print(prayer.region);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Text(" REGION ${prayer.region!}")
            ]

    )
    );
  }

}
