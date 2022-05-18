import 'package:flutter/material.dart';

import '../../../models/item_model.dart';
import '../../../utils/buttons_style.dart';
import '../../../utils/texts_style.dart';
import '../../item_info/item_info.dart';

class FavoritesBodyWidget extends StatefulWidget {
  final List<ItemModel> favorites;
  final List<ItemModel> basket;
  final List<ItemModel> filter;
  final void Function() setStateParent;

  const FavoritesBodyWidget(
      {Key? key,
      required this.basket,
      required this.favorites,
      required this.filter,
      required this.setStateParent})
      : super(key: key);

  @override
  State<FavoritesBodyWidget> createState() => _FavoritesBodyWidgetState();
}

class _FavoritesBodyWidgetState extends State<FavoritesBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildGridItems();
  }

  Widget _buildGridItems() {
    return GridView.builder(
        itemCount: widget.favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: _buildItem);
  }

  Widget _buildItem(BuildContext context, int index) {
    ItemModel item = widget.favorites[index];
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
            child: IconButton(
                splashRadius: 1,
                onPressed: () {
                  _removeFavorite(item);
                },
                icon: const Icon(Icons.favorite)))
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
                  item: widget.favorites[index],
                  setStateParent: widget.setStateParent,
                )));
  }


  void _removeFavorite(ItemModel item) {
    int i = widget.favorites.indexOf(item);
    int index = widget.filter.indexOf(item);
    widget.filter[index].isFavorite = false;
    widget.favorites.removeAt(i);
    widget.setStateParent();
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
