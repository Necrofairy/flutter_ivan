import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/colors_rgb.dart';

abstract class TextsStyle {
  static const TextStyle buy = TextStyle(color: Color.fromRGBO(62, 53, 53, 1.0),
      fontWeight: FontWeight.w700);
  static const TextStyle sold = TextStyle(color: Colors.grey);
  static const TextStyle cancel = TextStyle(color: Colors.red);
  static const TextStyle blackText = TextStyle(color: Colors.black);
  static const TextStyle title = TextStyle(
      color: Colors.black,
      fontSize: 24,
      letterSpacing: 3,
      shadows: <Shadow>[
        Shadow(
            offset: Offset(-1, -1), blurRadius: 3, color: Colors.black)
      ]);
}