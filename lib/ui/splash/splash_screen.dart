import 'package:api_default_project/ui/on_boarding_screen/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quran.png'),
            SizedBox(
              height: 13,
            ),
            Text("Mening Qur'onim",style: TextStyle(color: Color(0xFF9543FF),fontWeight: FontWeight.w700,fontSize: 30),),
              Text("Qur'onni osongina o'qing",style: TextStyle(fontSize: 15,color: Color(0xFFA8A8A8),fontWeight: FontWeight.w400),),
            SizedBox(height: 200,),
          ZoomTapAnimation(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return OnBoarding();
              }));
            },
            child: Container(
              height: 53,
              width: 181,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xFF9543FF),
              ),
              child: Center(child: Text('Hozir oʻqing',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 15),)),
            ),
          )
            ],
        ),
      ),
    );
  }
}
