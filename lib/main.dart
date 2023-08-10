import 'package:api_default_project/provider/car_item_provider.dart';
import 'package:api_default_project/provider/car_provider.dart';
import 'package:api_default_project/provider/countries_provider.dart';
import 'package:api_default_project/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>CarItemProvider(),),
      ChangeNotifierProvider(create: (context)=>CarProvider(),),
      ChangeNotifierProvider(create: (context)=>CountryProvider(),),
    ],
    child: MyApp(),
  )
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TabBox(),
        );
      },
    );;
  }
}
