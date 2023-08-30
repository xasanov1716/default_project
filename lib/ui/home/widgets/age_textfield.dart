import 'package:api_default_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AgeTextField extends StatefulWidget {
  AgeTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    this.obscureText = false,
    this.maxLine = 1,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final bool obscureText;
  final TextEditingController controller;
  final int maxLine;

  @override
  State<AgeTextField> createState() => _AgeTextFieldState();
}

class _AgeTextFieldState extends State<AgeTextField> {

FocusNode focusNode = FocusNode();
var ageMaskFormatter = MaskTextInputFormatter(
  mask: '##',
  filter: {'#': RegExp(r'[0-9]')},
);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xFF4F8962),
      maxLines: widget.maxLine,
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: "DMSans"),
      textAlign: widget.textAlign,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: focusNode,
      inputFormatters: [ageMaskFormatter],
      onChanged: (v){
        v.length == 2? focusNode.unfocus(): const SizedBox();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
