import 'package:api_default_project/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: provider.isLoading ? CupertinoActivityIndicator() : Column(
        children: [
          Text('data')
        ],
      ),
    );
  }
}
