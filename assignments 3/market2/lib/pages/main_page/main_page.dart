import 'package:flutter/material.dart';
import 'package:market2/models/item_model.dart';
import 'package:market2/pages/main_page/widgets/shop_widget.dart';
import 'package:market2/utils/app_bar_static.dart';
class MainPage extends StatefulWidget {
  final List<ItemModel> basket;
  final void Function() setStateParent;
  const MainPage({Key? key, required this.basket, required this.setStateParent}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic.shopAppBar(child: _iconBasket(), num:  _calculateNum(), title: 'PC Shop'),
      body: ShopWidget(basket: widget.basket, setStateParent: widget.setStateParent,),
    );
  }

  int _calculateNum() {
    if (widget.basket.isEmpty) return 0;
    int num = 0;
    for (ItemModel item in widget.basket) {
      num += item.count;
    }
    return num;
  }

  Widget _iconBasket() {
    return Expanded(
      child: IconButton(
          icon: const Icon(Icons.shopping_basket_outlined), onPressed: _moveBasket),
    );
  }

  void _moveBasket() {
    Navigator.pushNamed(context, '/basket');
    setState(() {

    });
  }
}
