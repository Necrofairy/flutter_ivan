import 'package:flutter/material.dart';
import 'package:market2/utils/app_bar_static.dart';
import 'package:market2/utils/buttons_style.dart';
import 'package:market2/utils/colors_rgb.dart';
import 'package:market2/utils/texts_style.dart';

import '../../models/item_model.dart';

class ItemInfo extends StatelessWidget {
  final List<ItemModel> basket;
  final ItemModel item;
  final void Function() setStateParent;

  const ItemInfo(
      {Key? key,
      required this.basket,
      required this.item,
      required this.setStateParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double back = 16;
    return Scaffold(
      backgroundColor: ColorsRGB.background,
      appBar: AppBarStatic.shopAppBar(
          child: _buildIconBasket(context),
          sum: _calculateSum(),
          title: 'О товаре:'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              Text(
                item.name,
                style: TextsStyle.titleInfo,
              ),
              SizedBox(
                height: back,
              ),
              Image.asset(
                item.descriptionImage,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: back,
              ),
              Text(item.description),
              SizedBox(
                height: back,
              ),
              Text('На складе осталось ${item.num} штук!'),
              SizedBox(
                height: back,
              ),
              _buildButton(item),
            ],
          ),
        ),
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

  Widget _buildIconBasket(BuildContext context) {
    return Expanded(
      child: IconButton(
          icon: const Icon(Icons.shopping_basket_outlined),
          onPressed: () {
            _moveBasket(context);
          }),
    );
  }

  void _moveBasket(BuildContext context) {
    Navigator.pushNamed(context, '/basket');
  }

  Widget _buildButton(ItemModel item) {
    if (item.num != 0) {
      return ElevatedButton(
          style: ButtonsStyle.button,
          onPressed: () => _buy(item),
          child: Text('Купить за ${item.price}'));
    }
    return ElevatedButton(
        style: ButtonsStyle.button,
        onPressed: null,
        child: Text('Купить за ${item.price}'));
  }

  void _buy(ItemModel item) {
    if (item.num == 0) return;
    item.num--;
    item.count++;
    if (!basket.contains(item)) {
      basket.add(item);
    }
    setStateParent();
  }
}
