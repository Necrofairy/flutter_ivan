import 'package:flutter/material.dart';
import 'package:market2/pages/basket/basket.dart';
import 'package:market2/pages/main_page/main_page.dart';

import 'models/item_model.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<ItemModel> basket = [];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(basket: basket, setStateParent: () => setState((){}),),
        '/basket': (context) => Basket(basket: basket, setStateParent: () => {setState((){})},),
      },
    );
  }

}
