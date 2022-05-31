import 'package:flutter/material.dart';
import 'package:market2/utils/buttons_style.dart';
import 'package:market2/utils/colors_rgb.dart';

import '../../../models/item_model.dart';

class BasketBody extends StatelessWidget {
  final List<ItemModel> basket;
  final void Function() setStateParent;

  const BasketBody(
      {Key? key,
      required this.basket,
      required this.setStateParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            padding: const EdgeInsets.only(top: 55),
            itemCount: basket.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 4),
            itemBuilder: _buildItemGrid),
        Row(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: _buildBuyButton(),
                )),
            Expanded(
                child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: _buildCancelButton())),
          ],
        ),
      ],
    );
  }

  Widget _buildItemGrid(BuildContext context, int index) {
    ItemModel item = basket[index];
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        elevation: 5,
        shadowColor: ColorsRGB.activeCardShadow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
                child: Image.asset(
              item.mainImage,
              fit: BoxFit.cover,
            )),
            const SizedBox(
              height: 4,
            ),
            Text('К покупке ${item.count} за \$ ${item.count * item.price}'),
            TextButton(
                style: ButtonsStyle.textButton,
                onPressed: () => _cancel(item),
                child: const Text(
                  'Отменить покупку!',
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildBuyButton() {
    Widget button = basket.isNotEmpty
        ? ElevatedButton(
            style: ButtonsStyle.button,
            onPressed: _buyAll,
            child: Text('Купить \$ ${_calculateSum()}'))
        : ElevatedButton(
            style: ButtonsStyle.button,
            onPressed: null,
            child: const Text('Купить'));
    return button;
  }

  Widget _buildCancelButton() {
    Widget button = basket.isNotEmpty
        ? ElevatedButton(
            style: ButtonsStyle.button,
            onPressed: _cancelAll,
            child: const Text('Отменить'))
        : ElevatedButton(
            style: ButtonsStyle.button,
            onPressed: null,
            child: const Text('Отменить'));
    return button;
  }

  void _cancel(ItemModel item) {
    item.num += item.count;
    item.count = 0;
    basket.remove(item);
    setStateParent();
  }

  void _buyAll() {
    for (ItemModel item in basket) {
      item.count = 0;
    }
    basket.clear();
    setStateParent();
  }

  void _cancelAll() {
    for (ItemModel item in basket) {
      item.num += item.count;
      item.count = 0;
    }
    basket.clear();
    setStateParent();
  }

  int _calculateSum() {
    int price = 0;
    for(ItemModel item in basket) {
      price += item.price * item.count;
    }
    return price;
  }
}
