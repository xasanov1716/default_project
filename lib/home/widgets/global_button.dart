import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.blue.withOpacity(0.9)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1),
          )),
        ),
      ),
    );
  }
}
