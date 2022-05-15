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
  List<ItemModel> favorite = [];
  bool isShowFavorite = false;

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
          child: Row(
            mainAxisAlignment: isShowFavorite == true
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              isShowFavorite == false
                  ? Expanded(
                      flex: 10,
                      child: TextField(
                        controller: _searchController,
                        decoration: DecorationTextField.decoration,
                      ),
                    )
                  : const Text('Избранное'),
              isShowFavorite == false
                  ? Expanded(
                      child: IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        _showFavorite();
                      },
                    ))
                  : IconButton(
                      onPressed: () {
                        _showFavorite();
                      },
                      icon: const Icon(Icons.favorite)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    ItemModel item = filter[index];
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
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
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextsStyle.title,
                ),
                Expanded(child: Image.asset(item.mainImage, fit: BoxFit.cover)),
                Text(
                  'На складе осталось - ${item.num}',
                  style: TextsStyle.text,
                ),
                Text(
                  'Цена: \$ ${item.price}',
                  style: TextsStyle.price,
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: item.isFavorite
              ? IconButton(
                  onPressed: () {
                    _removeFavorite(item);
                  },
                  icon: const Icon(Icons.favorite))
              : IconButton(
                  onPressed: () {
                    _addFavorite(item);
                  },
                  icon: const Icon(Icons.favorite_border)),
        )
      ],
    );
  }

  void _readInfo(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemInfo(
                  basket: widget.basket,
                  item: filter[index],
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
    return;
  }

  void _addFavorite(ItemModel item) {
    item.isFavorite = true;
    favorite.add(item);
    setState(() {});
  }

  void _removeFavorite(ItemModel item) {
    item.isFavorite = false;
    int i = favorite.indexOf(item);
    favorite.removeAt(i);
    setState(() {});
  }

  void _showFavorite() {
    if (isShowFavorite == false) {
      isShowFavorite = true;
      filter = favorite;
    } else {
      isShowFavorite = false;
      filter = Items.items;
    }
    setState(() {});
  }
}
