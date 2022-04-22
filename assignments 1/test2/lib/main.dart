import 'package:flutter/material.dart';
import 'package:test2/instagram/instagram_menu.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Instagram', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),body: InstagramMenu(),
    ),
  ));
}
