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
  List<bool> isFavorite = [];
  bool isSwitchFavorite = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchItem);
    filter = Items.items;
    for (int i = 0; i < Items.items.length; i++) {
      isFavorite.add(false);
    }
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
            children: [
              Expanded(
                flex: 10,
                child: TextField(
                  controller: _searchController,
                  decoration: DecorationTextField.decoration,
                ),
              ),
              Expanded(child: IconButton(icon: Icon(Icons.favorite), onPressed: _buildFavorite,))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
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
                  filter[index].name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextsStyle.title,
                ),
                Expanded(
                    child: Image.asset(filter[index].mainImage,
                        fit: BoxFit.cover)),
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
        ),
        Container(
          alignment: Alignment.topRight,
          child: isFavorite[index] == false
              ? IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    _addFavorite(index);
                  },
                )
              : IconButton(
                  onPressed: () {
                    _addFavorite(index);
                  },
                  icon: const Icon(Icons.favorite)),
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
    if (isSwitchFavorite == false) {
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
    if (query.isNotEmpty) {
      filter = favorite
          .where((element) =>
          element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filter = favorite;
    }
    setState(() {

    });

  }

  void _addFavorite(int index) {
    if (isFavorite[index] == false) {
      isFavorite[index] = true;
      favorite.add(filter[index]);
    } else {
      isFavorite[index] = false;
      int i = favorite.indexOf(filter[index]);
      favorite.removeAt(i);
    }
    setState(() {});
  }

  void _buildFavorite() {
    if (isSwitchFavorite == false) {
      isSwitchFavorite = true;
      filter = favorite;
    } else {
      isSwitchFavorite = false;
      filter = Items.items;
    }
    setState(() {

    });
  }
}
