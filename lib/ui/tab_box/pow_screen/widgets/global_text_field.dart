import 'package:flutter/material.dart';



class UniversalTextField extends StatelessWidget {
  const UniversalTextField({Key? key, required this.controller, required this.hintext, required this.type, required this.action}) : super(key: key);


  final TextEditingController controller;
  final String hintext;
  final TextInputType type;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 20,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintext,
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0C1A30),
            fontFamily: "DMSans"),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Color(0xFF0C1A30)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF0C1A30),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF0C1A30),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF0C1A30),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF0C1A30),
          ),
        ),
      ),
    );
  }
}
