import 'package:flutter/material.dart';
import 'package:market2/models/item_model.dart';
import 'package:market2/pages/main_page/widgets/shop_widget.dart';
import 'package:market2/utils/app_bar_static.dart';
import 'package:market2/utils/colors_rgb.dart';

class MainPage extends StatelessWidget {
  final List<ItemModel> basket;
  final void Function() setStateParent;

  const MainPage({Key? key, required this.basket, required this.setStateParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRGB.background,
      appBar: AppBarStatic.shopAppBar(
          child: _iconBasket(context), sum: _calculateSum(), title: 'PC Shop'),
      body: ShopWidget(
        basket: basket,
        setStateParent: setStateParent,
      ),
    );
  }

  String _calculateSum() {
    if (basket.isEmpty) return '0';
    int num = 0;
    int price = 0;
    for (ItemModel item in basket) {
      num += item.count;
      price += item.count * item.price;
    }
    return '$num -  \$ $price';
  }

  Widget _iconBasket(BuildContext context) {
    return Expanded(
      child: IconButton(
          icon: const Icon(Icons.shopping_basket_outlined),
          onPressed: (){_moveBasket(context);}),
    );
  }

  void _moveBasket(BuildContext context) {
    Navigator.pushNamed(context, '/basket');
  }


}
