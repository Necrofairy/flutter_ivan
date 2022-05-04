import 'package:flutter/material.dart';

abstract class ButtonsStyle {
  static final ButtonStyle cancelAll =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red));
  static final ButtonStyle cancel =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white));
  static final ButtonStyle buyAll =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green));
  static final ButtonStyle buy =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white));
  static final ButtonStyle sold =
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white));
}
