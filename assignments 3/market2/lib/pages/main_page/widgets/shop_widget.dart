import 'package:flutter/material.dart';
import 'package:market2/models/item_model.dart';
import 'package:market2/pages/item_info/item_info.dart';
import 'package:market2/utils/decoration._text_field.dart';
import 'package:market2/utils/items.dart';

import '../../../utils/texts_style.dart';

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
  final _searchController = TextEditingController();
  List<ItemModel> filter = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchItem);
    filter = Items.items;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            padding: const EdgeInsets.only(top: 70),
            itemCount: filter.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: _buildGridItem),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: TextField(
            controller: _searchController,
            decoration: DecorationTextField.decoration,
          ),
        )
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(width: 1),
        bottom: BorderSide(width: 1),
        left: BorderSide(width: 1),
        right: BorderSide(width: 1),
      )),
      child: TextButton(
        onPressed: () => {_readInfo(context, index)},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              filter[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextsStyle.title,
            ),
            Expanded(
                child: Image.asset(filter[index].mainImage, fit: BoxFit.cover)),
            Text(
              'На складе осталось - ${filter[index].num}',
              style: TextsStyle.text,
            ),
            Text(
              'Цена: \$ ${filter[index].price}',
              style: TextsStyle.price,
            ),
          ],
        ),
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

  void _searchItem() {
    String query = _searchController.text;
    if (query.isNotEmpty) {
      filter = Items.items
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filter = Items.items;
    }
    setState(() {});
  }
}
