import 'package:flutter/material.dart';

abstract class DecorationTextField {
  static const decoration = InputDecoration(
      labelText: 'Find:',
      labelStyle: TextStyle(color: Colors.purple),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.purple,
      )));
}
