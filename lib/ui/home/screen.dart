import 'package:api_default_project/data/network/api_repository/login_repository.dart';
import 'package:api_default_project/data/network/api_repository/products_repository.dart';
import 'package:api_default_project/data/network/api_repository/user_repository.dart';
import 'package:api_default_project/models/products/products_model.dart';
import 'package:api_default_project/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/network/api_provider.dart';

class CardScreen1 extends StatefulWidget {
  const CardScreen1({Key? key}) : super(key: key);

  @override
  State<CardScreen1> createState() => _CardScreen1State();
}

class _CardScreen1State extends State<CardScreen1> {
  final  currencyRepository =
  ProductRepository(apiProvider: ApiProvider());

  List<ProductModel> card = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    card = await currencyRepository.fetchProducts();
    print("CURRENCY FETCH FINISHED:${card.length}");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Card Screen",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : card.isEmpty
          ? const Center(child: Text("Xatolik sodir bo'ldi"))
          : ListView(
        physics: const BouncingScrollPhysics(),
        children: List.generate(card.length, (index) => ListTile(
          title: Text(card[index].title),
          subtitle: Text("${card[index].id}"),
          trailing: Image.network(card[index].image,height: 30,),
        ))
      ),
    );
  }
}