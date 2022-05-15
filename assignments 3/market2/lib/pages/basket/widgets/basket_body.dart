import 'package:flutter/material.dart';
import 'package:market2/utils/buttons_style.dart';

import '../../../models/item_model.dart';

class BasketBody extends StatefulWidget {
  final List<ItemModel> basket;
  final void Function() setStateParent;

  const BasketBody(
      {Key? key,
      required this.basket,
      required this.setStateParent})
      : super(key: key);

  @override
  State<BasketBody> createState() => _BasketBodyState();
}

class _BasketBodyState extends State<BasketBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            padding: const EdgeInsets.only(top: 47),
            itemCount: widget.basket.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 4),
            itemBuilder: _buildItemGrid),
        Row(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  child: _buildBuyButton(),
                )),
            Expanded(
                child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    child: _buildCancelButton())),
          ],
        ),
      ],
    );
  }

  Widget _buildItemGrid(BuildContext context, int index) {
    ItemModel item = widget.basket[index];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
          border: Border(
        top: BorderSide(width: 1),
        bottom: BorderSide(width: 1),
        left: BorderSide(width: 1),
        right: BorderSide(width: 1),
      )),
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
    );
  }

  Widget _buildBuyButton() {
    Widget button = widget.basket.isNotEmpty
        ? ElevatedButton(
            style: ButtonsStyle.button,
            onPressed: _buyAll,
            child: const Text('Купить'))
        : ElevatedButton(
            style: ButtonsStyle.button,
            onPressed: null,
            child: const Text('Купить'));
    return button;
  }

  Widget _buildCancelButton() {
    Widget button = widget.basket.isNotEmpty
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
    widget.basket.remove(item);
    widget.setStateParent();
  }

  void _buyAll() {
    for (ItemModel item in widget.basket) {
      item.count = 0;
    }
    widget.basket.clear();
    widget.setStateParent();
  }

  void _cancelAll() {
    for (ItemModel item in widget.basket) {
      item.num += item.count;
      item.count = 0;
    }
    widget.basket.clear();
    widget.setStateParent();
  }
}
