import 'package:api_default_project/cubits/login/login_cubit.dart';
import 'package:api_default_project/cubits/pow/pow_cubit.dart';
import 'package:api_default_project/ui/tab_box/tab_box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubits/navigation_bar/navigation_bar_cubit.dart';



Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => NavigationBarCubit(),
        lazy: false,
      ),
      BlocProvider(
        create: (_)=> PowCubit(),lazy: true,
      ),
      BlocProvider(
        create: (_)=> AuthCubit(),lazy: true,
      ),
    ], child: MyApp());
  }
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
          home: TabBox()
        );
      },
    );
  }
}
