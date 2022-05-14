import 'package:flutter/material.dart';
import 'package:market2/models/item_model.dart';
import 'package:market2/pages/item_info/item_info.dart';
import 'package:market2/utils/items.dart';

class ShopWidget extends StatefulWidget {
  final List<ItemModel> basket;
  final void Function() setStateParent;

  const ShopWidget(
      {Key? key, required this.basket, required this.setStateParent})
      : super(key: key);

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: Items.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: _buildGridItem);
  }

  Widget _buildGridItem(BuildContext context, int index) {
    return TextButton(
      onPressed: () => {_readInfo(context, index)},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            Items.items[index].name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(child: Image.asset(Items.items[index].mainImage, fit: BoxFit.cover)),
          Text('На складе осталось - ${Items.items[index].num}'),
          Text('Цена: \$ ${Items.items[index].price}'),
        ],
      ),
    );
  }

  void _readInfo(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemInfo(
                  basket: widget.basket,
                  index: index,
                  setStateParent: widget.setStateParent,
                )));
  }
}
