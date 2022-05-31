import 'package:flutter/material.dart';

abstract class AppBarWidget {
  static final appBar = AppBar(
    title: const Text(
      'Instagram',
      style: TextStyle(color: Colors.black, fontSize: 24),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
  );
}
