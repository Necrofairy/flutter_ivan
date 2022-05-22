import 'package:flutter/material.dart';
import 'package:market2/utils/colors_rgb.dart';

import '../../../models/item_model.dart';
import '../../../utils/buttons_style.dart';
import '../../../utils/texts_style.dart';
import '../../item_info/item_info.dart';

class FavoritesBodyWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return _buildGridItems();
  }

  Widget _buildGridItems() {
    return GridView.builder(
        itemCount: favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: _buildItem);
  }

  Widget _buildItem(BuildContext context, int index) {
    ItemModel item = favorites[index];
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
    if (item.count == 0) return ColorsRGB.passiveCardShadow;
    return ColorsRGB.activeCardShadow;
  }

  void _readInfo(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemInfo(
                  basket: basket,
                  item: favorites[index],
                  setStateParent: setStateParent,
                )));
  }


  void _removeFavorite(ItemModel item) {
    int i = favorites.indexOf(item);
    int index = filter.indexOf(item);
    filter[index].isFavorite = false;
    favorites.removeAt(i);
    setStateParent();
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
