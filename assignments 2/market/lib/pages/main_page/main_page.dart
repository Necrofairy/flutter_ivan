import 'package:flutter/material.dart';
import 'package:market/pages/main_page/widgets/scaffold_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor:
                    Color.fromRGBO(215, 211, 211, 0.30196078431372547)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                backgroundColor:
                    Color.fromRGBO(215, 211, 211, 0.30196078431372547))),
        home: const ScaffoldWidget());
  }
}
