import 'package:flutter/material.dart';

class ApiSwich {
  static Color returnColor(String color) {
    switch (color) {
      case '#000000':
        return const Color(0x0ff00000);
      case '#0000FF':
        return const Color(0x000000ff);

      case '#008000':
        return const Color(0x00008000);

      case '#FF0000':
        return const Color(0x00ff0000);
      case '#FF7F50':
        return const Color(0x00ff7f50);
    }
    return Colors.black;
  }
}
