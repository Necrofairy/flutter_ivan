import 'package:flutter/material.dart';

abstract class AppBarStatic {
  static AppBar shopAppBar({required Widget child,
      required int num, required String title}) {
    var appBarShop = AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        Column(
          children: [
            child,
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text('$num'),
            ),
          ],
        )
      ],
    );
    return appBarShop;
  }
}
