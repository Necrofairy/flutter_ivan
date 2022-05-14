import 'package:flutter/material.dart';
import 'package:market2/utils/app_bar_static.dart';

import '../../models/item_model.dart';
import '../../utils/items.dart';

class ItemInfo extends StatefulWidget {
  final List<ItemModel> basket;
  final int index;
  final void Function() setStateParent;

  const ItemInfo(
      {Key? key,
      required this.basket,
      required this.index,
      required this.setStateParent})
      : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  Widget build(BuildContext context) {
    ItemModel item = Items.items[widget.index];
    return Scaffold(
      appBar: AppBarStatic.shopAppBar(
          child: _buildIconBasket(),
          num: _calculateNum(),
          title: 'Информация о товаре'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(item.name),
            Image.asset(item.descriptionImage, fit: BoxFit.cover,),
            Text(item.description),
            Text('На складе осталось ${item.num} штук!'),
            ElevatedButton(
                onPressed: () => {_buy(item)},
                child: Text('Купить за ${item.price}'))
          ],
        ),
      ),
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

  Widget _buildIconBasket() {
    return Expanded(
      child: IconButton(
          icon: const Icon(Icons.shopping_basket_outlined),
          onPressed: _moveBasket),
    );
  }

  void _moveBasket() {
    Navigator.pushNamed(context, '/basket');
  }

  void _buy(ItemModel item) {
    if (item.num == 0) return;
    item.num--;
    item.count++;
    if (!widget.basket.contains(item)) {
      widget.basket.add(item);
    }
    widget.setStateParent();
  }
}
