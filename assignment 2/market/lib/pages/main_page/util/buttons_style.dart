import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/colors_rgb.dart';

abstract class ButtonsStyle {
  static final ButtonStyle cancelAll =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsRGB.cancelButtonColor));
  static final ButtonStyle cancel =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white));
  static final ButtonStyle buyAll =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsRGB.buyButtonColor));
  static final ButtonStyle buy = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
  minimumSize: MaterialStateProperty.all(const Size(10, 10)));
  static final ButtonStyle sold =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          minimumSize: MaterialStateProperty.all(const Size(10, 10)));
}
