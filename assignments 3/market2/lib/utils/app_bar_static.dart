import 'package:flutter/material.dart';
import 'package:market2/utils/colors_rgb.dart';
import 'package:market2/utils/texts_style.dart';

abstract class AppBarStatic {
  static AppBar shopAppBar({required Widget child,
      required int num, required String title}) {
    var appBarShop = AppBar(
      title: Text(title, style: TextsStyle.titleAppBar,),
      backgroundColor: ColorsRGB.appBar,
      actionsIconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      actions: [
        Column(
          children: [
            child,
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text('$num', style: TextsStyle.text,),
            ),
          ],
        )
      ],
    );
    return appBarShop;
  }
}
