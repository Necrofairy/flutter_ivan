import 'package:flutter/material.dart';
import 'package:market2/utils/colors_rgb.dart';

abstract class ButtonsStyle {
  static final button = ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.black),
      backgroundColor: MaterialStateProperty.all(ColorsRGB.buttonsActive));
  static final textButton = ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
      minimumSize: MaterialStateProperty.all(const Size(10, 10)));
}
