
import 'package:flutter/material.dart';

import '../../../models/item_model.dart';

class BasketBody extends StatefulWidget {
  final List<ItemModel> basket;
  final void Function() setStateParent;
  final void Function() setStateBasket;

  const BasketBody(
      {Key? key, required this.basket, required this.setStateParent, required this.setStateBasket})
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
            padding: const EdgeInsets.only(top: 40),
            itemCount: widget.basket.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 4),
            itemBuilder: _buildItemGrid),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: _buyAll,
              child: const Text('Купить'),
            )),
            Expanded(
                child: ElevatedButton(
              onPressed: _cancelAll,
              child: const Text('Отменить'),
            )),
          ],
        )
      ],
    );
  }

  Widget _buildItemGrid(BuildContext context, int index) {
    ItemModel item = widget.basket[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          item.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(
            child: Image.asset(
          item.mainImage,
          fit: BoxFit.cover,
        )),
        Text('К покупке ${item.count} за \$ ${item.count * item.price}'),
        TextButton(onPressed: ()  => _cancel(item), child: const Text('Отменить покупку!'))
      ],
    );
  }

  void _cancel(ItemModel item) {
    item.num += item.count;
    item.count = 0;
    widget.basket.remove(item);
    widget.setStateParent();
  }

  void _buyAll() {
    for(ItemModel item in  widget.basket) {
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
    widget.setStateParent;
  }
}
