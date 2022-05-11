import 'package:flutter/material.dart';

abstract class ButtonsStyle {
  static final ButtonStyle cancelAll =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red));
  static final ButtonStyle cancel =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white));
  static final ButtonStyle buyAll =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green));
  static final ButtonStyle buy = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
  minimumSize: MaterialStateProperty.all(const Size(10, 10)));
  static final ButtonStyle sold =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          minimumSize: MaterialStateProperty.all(const Size(10, 10)));
}
