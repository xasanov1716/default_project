import 'package:flutter/material.dart';

class CheckInfo extends StatelessWidget {
  const CheckInfo({super.key, required this.title, required this.trailing});

  final Widget title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          title,
          const Spacer(),
          trailing
        ],
      ),
    );
  }
}
