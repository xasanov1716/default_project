import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/network/providers/api_provider.dart';
import '../../data/network/repositories/login_repo.dart';
import '../../utils/utility_functions.dart';
import '../tab_box/tab_box.dart';
import '../widgets/global_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.loginRepo});

  final LoginRepo loginRepo;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Login Screen"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Icon(Icons.person_outline_outlined,color: Colors.black,size: 90,),
                SizedBox(height: 8,),
                SizedBox(height: 32,),
                TextField(
                  controller: usernameController,
                  decoration: getTextFieldDecoration("username"),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: passwordController,
                  decoration: getTextFieldDecoration("password"),
                ),
                const Spacer(),
                GlobalButton(
                    text: "Login",
                    onTap: () async {
                      if (usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        bool isLogged = await widget.loginRepo.loginUser(
                          username: usernameController.text,
                          password: passwordController.text,
                        );
                        setState(() {
                          isLoading = false;
                        });
                        if (isLogged && context.mounted) {
                          showCustomMessage(context, "User Logged");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TabBox(apiProvider: ApiProvider());
                              },
                            ),
                          );
                        } else {
                          showCustomMessage(context, "Error occurred...");
                        }
                      } else {
                        showCustomMessage(context, "Login data not valid!!!");
                      }
                    }),
                SizedBox(height: 24,)
              ],
            ),
          ),
          Visibility(
            visible: isLoading,
            child: const Align(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
