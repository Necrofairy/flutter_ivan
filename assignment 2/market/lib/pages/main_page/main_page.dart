import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/colors_rgb.dart';
import 'package:market/pages/main_page/widgets/scaffold_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: ColorsRGB.grey),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                backgroundColor: ColorsRGB.grey)),
        home: const ScaffoldWidget());
  }
}
