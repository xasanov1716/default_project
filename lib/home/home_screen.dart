import 'package:api_default_project/data/model/status/form_status.dart';
import 'package:api_default_project/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Users info",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<UserProvider>(
            builder: (context, provider, child) {
              switch (provider.status) {
                case FormStatus.pure:
                  return const Text("Hali data yuq , bo'sh holat");
                case FormStatus.success:
                  return Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(provider.users!.length, (index) {
                          return ListTile(
                            title: Text(
                              provider.users![index].title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            leading: Text(
                              "${provider.users![index].id.toString()}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text(
                              "User id : ${provider.users![index].userId.toString()}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          );
                        })
                      ],
                    ),
                  );
                case FormStatus.failure:
                  return Center(child: Text(provider.errorText));
                case FormStatus.loading:
                  return const Center(child: CupertinoActivityIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}