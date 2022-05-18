import 'package:flutter/material.dart';
import 'package:market2/pages/basket/widgets/basket_body.dart';
import 'package:market2/utils/app_bar_static.dart';
import 'package:market2/utils/colors_rgb.dart';

import '../../models/item_model.dart';

class Basket extends StatefulWidget {
  final List<ItemModel> basket;
  final void Function() setStateParent;

  const Basket({Key? key, required this.basket, required this.setStateParent})
      : super(key: key);

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRGB.background,
      appBar: AppBarStatic.shopAppBar(
          child: _buildIconBasket(), sum: _calculateSum(), title: 'Basket'),
      body: BasketBody(
        basket: widget.basket,
        setStateParent: widget.setStateParent,
      ),
    );
  }

  String _calculateSum() {
    if (widget.basket.isEmpty) return '0';
    int num = 0;
    int price = 0;
    for (ItemModel item in widget.basket) {
      num += item.count;
      price += item.count * item.price;
    }
    return '$num -  \$ $price';
  }

  Widget _buildIconBasket() {
    return const Expanded(
        child: IconButton(
            onPressed: null, icon: Icon(Icons.shopping_basket_outlined)));
  }
}
