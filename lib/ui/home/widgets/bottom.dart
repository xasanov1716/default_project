import 'package:flutter/material.dart';


class CalcButtom extends StatelessWidget {
  const CalcButtom({Key? key, required this.onTap, required this.text}) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap,style: TextButton.styleFrom(
        backgroundColor: Colors.green
    ), child:  Text(text,style: TextStyle(color: Colors.white),),);
  }
}
