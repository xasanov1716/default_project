import 'package:api_default_project/cubit/downloader_cubit.dart';
import 'package:api_default_project/ui/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  runApp(BlocProvider(
    create: (context) => DownLoaderCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllFileScreen(),
    );
  }
}
