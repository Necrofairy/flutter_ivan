import 'package:flutter/material.dart';
import 'package:market2/models/item_model.dart';
import 'package:market2/pages/item_info/item_info.dart';
import 'package:market2/utils/decoration._text_field.dart';
import 'package:market2/utils/items.dart';

import '../../../utils/buttons_style.dart';
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
        _buildShopGrid(),
        _buildSearchAndFavorite(),
      ],
    );
  }

  Widget _buildShopGrid() {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 70),
        itemCount: filter.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: _buildGridItem);
  }

  Widget _buildSearchAndFavorite() {
    return Padding(
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
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    ItemModel item = filter[index];
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Material(
            elevation: 5,
            shadowColor: _shadowCard(item),
            child: TextButton(
              onPressed: () => {_readInfo(context, index)},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextsStyle.title,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                      child: Image.asset(item.mainImage, fit: BoxFit.cover)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'На складе осталось - ${item.num}',
                    style: TextsStyle.text,
                  ),
                  _buildButton(item),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: item.isFavorite
              ? IconButton(
                  splashRadius: 1,
                  onPressed: () {
                    _removeFavorite(item);
                  },
                  icon: const Icon(Icons.favorite))
              : IconButton(
                  splashRadius: 1,
                  onPressed: () {
                    _addFavorite(item);
                  },
                  icon: const Icon(Icons.favorite_border)),
        )
      ],
    );
  }

  Color _shadowCard(ItemModel item) {
    if (item.count == 0) return Colors.black;
    return Colors.purple;
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
    if (!widget.basket.contains(item)) {
      widget.basket.add(item);
    }
    widget.setStateParent();
  }
}
