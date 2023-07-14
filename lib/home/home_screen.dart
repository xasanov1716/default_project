import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/network/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokemons;
  ApiProvider apiProvider = ApiProvider();

  _init() async {
    print(await apiProvider.getPokemon());
    pokemons = await apiProvider.getPokemon();
    setState(() {});
    print(pokemons);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
              child: Image.asset(
            "assets/images/img.png",
            width: 252,
            height: 88,
          )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Buscar Pokémon",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  ...List.generate(pokemons.length, (index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 117,
                                width: 177,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFFC7CFF)),
                              ),
                            ),
                            Align(
                              child:  CachedNetworkImage(
                                imageUrl: pokemons[index].img,
                                placeholder: (context, url) {
                                  return CupertinoActivityIndicator();
                                },
                                errorWidget: (context, url, error) {
                                  return Icon(Icons.error);
                                },
                              ),
                              alignment: Alignment.topCenter,
                            ),
                          ],
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
