import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/network/api_provider.dart';
import '../../data/network/api_repository.dart';
import '../../models/card_model.dart';

class CardScreen1 extends StatefulWidget {
  const CardScreen1({Key? key}) : super(key: key);

  @override
  State<CardScreen1> createState() => _CardScreen1State();
}

class _CardScreen1State extends State<CardScreen1> {
  final CardRepository currencyRepository =
      CardRepository(apiProvider: ApiProvider());

  List<BankModel> card = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    card = await currencyRepository.fetchCard();
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
                  children: List.generate(
                    card.length,
                    (index) {
                      BankModel cardModel = card[index];
                      String colorA =
                          "0xFF${cardModel.colors["color_a"].toString().substring(1)}";
                      String colorB =
                          "0xFF${cardModel.colors["color_b"].toString().substring(1)}";
                      return ZoomTapAnimation(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          margin: const EdgeInsets.only(
                              left: 12, right: 12, top: 12, bottom: 8),
                          height: 220,
                          width: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(int.parse(colorB)),
                                  Color(int.parse(colorA)),
                                ],
                                begin: Alignment.center,
                                end: Alignment.centerLeft),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    cardModel.bankName,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    cardModel.iconImage,
                                    height: 36,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cardModel.cardNumber,
                                    style: const TextStyle(
                                        letterSpacing: 4,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "EXPIRE DATE: ${cardModel.expireDate}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  Text(
                                    cardModel.cardType,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                              "${cardModel.moneyAmount.toInt()} ",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600),
                                          children: [
                                        const TextSpan(
                                            text: " SO'M",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.white))
                                      ]))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
