import 'package:api_default_project/bloc/user/user_bloc.dart';
import 'package:api_default_project/bloc/user_multi_state/multi_state_bloc.dart';
import 'package:api_default_project/data/repositories/repositories.dart';
import 'package:api_default_project/local/db/local_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'ui/home/users_screen.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDatabase.getInstance;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RepositoryProvider(create: (_)=>UserRepository(),
      child: BlocProvider(
        create: (_) => UserBloc(userRepository: UserRepository()),
    child:const MyApp()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home: UsersScreen()
    );
  }
}