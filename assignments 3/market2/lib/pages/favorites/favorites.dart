import 'package:flutter/material.dart';
import 'package:market2/pages/favorites/widgets/favorites_body_widget.dart';
import 'package:market2/utils/app_bar_static.dart';

import '../../models/item_model.dart';

class Favorites extends StatelessWidget {
  final List<ItemModel> favorites;
  final List<ItemModel> basket;
  final List<ItemModel> filter;
  final void Function() setStateParent;

  const Favorites(
      {Key? key,
      required this.favorites,
      required this.basket,
      required this.filter,
      required this.setStateParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic.shopAppBar(
          child: _iconBasket(context), sum: _calculateSum(), title: 'Избранное:'),
      body: FavoritesBodyWidget(
        favorites: favorites,
        basket: basket,
        filter: filter,
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
