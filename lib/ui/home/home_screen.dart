import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/ui/home/widgets/bottom.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../providers/calculator_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorProvider>(context, listen: false);

    TextEditingController number1 = TextEditingController();
    TextEditingController number2 = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Consumer<CalculatorProvider>(
                    builder: (context, answer, child) {
                      return answer.getAnswer() != 0
                          ? Text(
                              answer.getAnswer().toString(),
                              style: const TextStyle(
                                  fontSize: 45, color: Colors.white),
                            )
                          : const SizedBox();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(5),
                ],
                controller: number1,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Number one',
                  hintStyle: TextStyle(color: Colors.white),
                  // label: Text("Enter number one",style: TextStyle(color: Colors.white),),
                  border: OutlineInputBorder(),
                  focusColor: Colors.red,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(5),
                ],
                controller: number2,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Number two',
                    hintStyle: TextStyle(color: Colors.white),
                    // label: Text("Enter number two",style: TextStyle(color: Colors.white),),
                    border: OutlineInputBorder(),
                    focusColor: Colors.red),
              ),
              Row(
                children: [
                  const Spacer(),
                  ZoomTapAnimation(
                    onTap: () {
                      number2.clear();
                      number1.clear();
                      provider.sumOfNumbers(0, 0);
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 32),
                        height: 60,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Center(
                            child: const Text(
                          "C",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.red, fontSize: 32),
                        ))),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    child: CalcButtom(onTap: (){if (number1.text.isNotEmpty &&
                        number2.text.isNotEmpty) {
                      provider.add(
                          int.parse(number1.text), int.parse(number2.text));
                    } else {
                      Fluttertoast.showToast(
                        msg: "Enter two numbers",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                      );
                    }},text: 'Add',)
                  ),
                  SizedBox(
                    height: 60,
                    child: CalcButtom(
                      onTap: () {
                        if (number1.text.isNotEmpty &&
                            number2.text.isNotEmpty) {
                          provider.subtraction(
                              int.parse(number1.text), int.parse(number2.text));
                        } else {
                          Fluttertoast.showToast(
                            msg: "Enter two numbers",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }
                      },
                      text: 'Subtraction',
                    )
                  ),
                  SizedBox(
                    height: 60,
                    child: CalcButtom(
                      onTap: () {
                        if (number1.text.isNotEmpty &&
                            number2.text.isNotEmpty) {
                          provider.multiplication(
                              int.parse(number1.text), int.parse(number2.text));
                        } else {
                          Fluttertoast.showToast(
                            msg: "Enter two numbers",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }
                      },
                      text: 'Multiplication',
                    )
                  ),
                  SizedBox(
                    height: 60,
                    child: CalcButtom(
                      onTap: () {
                        if (number1.text.isNotEmpty &&
                            number2.text.isNotEmpty) {
                          provider.division(
                              int.parse(number1.text), int.parse(number2.text));
                        } else {
                          Fluttertoast.showToast(
                            msg: "Enter two numbers",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }
                      },
                      text: 'Division',
                    )
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    child: CalcButtom(
                      onTap: () {
                        if (number1.text.isNotEmpty &&
                            number2.text.isNotEmpty) {
                          provider.middleArithmetic(
                              int.parse(number1.text), int.parse(number2.text));
                        } else {
                          Fluttertoast.showToast(
                            msg: "Enter two numbers",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }
                      },
                      text: 'Middle Arithmetic',
                    )
                  ),
                  SizedBox(
                    height: 60,
                    child: CalcButtom(
                      onTap: () {
                        if (number1.text.isNotEmpty &&
                            number2.text.isNotEmpty) {
                          provider.mediumGeometric(
                              int.parse(number1.text), int.parse(number2.text));
                        } else {
                          Fluttertoast.showToast(
                            msg: "Enter two numbers",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }
                      },
                      text: 'Medium Geometric',
                    )
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                  height: 60,
                  child: CalcButtom(
                    onTap: () {
                      if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                        provider.sumOfNumbers(
                            int.parse(number1.text), int.parse(number2.text));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Enter two numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                        );
                      }
                    },
                    text: 'Sum Of Numbers',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
