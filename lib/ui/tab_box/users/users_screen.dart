import 'package:api_default_project/data/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/network/providers/api_provider.dart';
import '../../../data/network/repositories/login_repo.dart';
import '../../../data/network/repositories/user_repo.dart';
import '../../login/login_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key, required this.userRepo}) : super(key: key);

  final UserRepo userRepo;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {


  List<UserModel> user = [];

  _updateProducts() async {
    setState(() {
      isLoading = true;
    });
    user =
    await widget.userRepo.getAllUsers();
    setState(() {
      isLoading = false;
    });
  }


  @override
  void initState() {
      _updateProducts();
    super.initState();
  }
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Users screen"),
        actions: [
          IconButton(
              onPressed: () {
                widget.userRepo.logOutUser();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen(
                          loginRepo: LoginRepo(apiProvider: ApiProvider()));
                    },
                  ),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: isLoading ? Center(child: CupertinoActivityIndicator(),) : ListView(
            children: List.generate(user.length, (index) => ListTile(
              title: Text("${user[index].name.firstname} ${user[index].name.lastname}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(user[index].address.city),
                  Text(user[index].address.street),
                  Text(user[index].address.zipcode),
                  Text("${user[index].address.number}"),
                ],
              ),
              leading: Text("${user[index].id }"),
            )),
          ))
        ],
      ),
    );
  }
}
