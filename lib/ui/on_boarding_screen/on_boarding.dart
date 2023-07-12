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


class _OnBoardingState extends State<OnBoarding> {



  PrayerInfoModel? prayer;
  ApiProvider apiProvider = ApiProvider();

  @override
  void initState() {
    getPrayerData();
    super.initState();
  }

  Future<void> getPrayerData() async {
    setState(() {});
    prayer = await apiProvider.getPrayer();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Text(" REGION ${prayer!.times.quyosh}")
            ]

    )
    );
  }

}
