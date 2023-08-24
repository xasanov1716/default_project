import 'package:api_default_project/cubits/pow/pow_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class UniversalTextField extends StatelessWidget {
  const UniversalTextField({Key? key, required this.hintext, required this.type, required this.action, required this.onChanged}) : super(key: key);


  final String hintext;
  final ValueChanged onChanged;
  final TextInputType type;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 20,
      keyboardType: type,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      onChanged: onChanged,
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
