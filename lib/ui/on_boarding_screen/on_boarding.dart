import 'dart:convert';

import 'package:api_default_project/data/models/prayer_info_models.dart';
import 'package:api_default_project/data/models/prayer_times_models.dart';
import 'package:api_default_project/data/network/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}


class _OnBoardingState extends State<OnBoarding> {

  ApiProvider apiProvider = ApiProvider();
  bool isLoading = false;
  PrayerInfoModel? prayer;
  _getPrayer()async{
    setState(() {
      isLoading = true;
    });
    prayer = await apiProvider.getPrayer();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getPrayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF180B37),
        body:  Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/img.png',width: double.infinity,fit: BoxFit.fill,),

                  Column(
                    children: [
                      SizedBox(height: 28,),
                      Row(
                        children: [
                          SizedBox(width: 40,),
                          Text('Jadwal Sholat',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
                         Spacer(),
                          Icon(Icons.notifications,color: Colors.white,size: 50,),
                          SizedBox(width: 28,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ]
    )  
    );
  }

}
