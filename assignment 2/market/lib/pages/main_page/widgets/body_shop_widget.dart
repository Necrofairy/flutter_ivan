import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/colors_rgb.dart';
import 'package:market/pages/main_page/util/find_decoration.dart';
import 'package:market/pages/main_page/util/images_name.dart';
import 'package:market/pages/main_page/util/products_info.dart';
import 'package:market/pages/main_page/util/products_info_static.dart';
import 'package:market/pages/main_page/util/switch_state.dart';
import 'package:market/pages/main_page/widgets/scaffold_widget.dart';

import '../util/buttons_style.dart';
import '../util/texts_style.dart';

class BodyShopWidget extends StatefulWidget {
  const BodyShopWidget({Key? key}) : super(key: key);

  @override
  State<BodyShopWidget> createState() => BodyShopWidgetState();
}

class BodyShopWidgetState extends State<BodyShopWidget> {
  List<ProductsInfo> basket = [];
  var filteredProducts = <ProductsInfo>[];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchProduct);
    filteredProducts = ProductsInfoStatic.products;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filteredProducts = ProductsInfoStatic.products;
    basket = context
        .dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!
        .basket;
  }

  void _searchProduct() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      filteredProducts =
          ProductsInfoStatic.products.where((ProductsInfo product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredProducts = ProductsInfoStatic.products;
    }
    setState(() {});
  }

  Widget _buildTextProductExist(int index) {
    int num = filteredProducts[index].num;
    if (num > 0) {
      return const Text('Есть в наличии -');
    }
    return const Text('Нет в наличии -');
  }

  Widget _buildTextButton(int index) {
    int num = filteredProducts[index].num;
    if (num > 0) {
      return TextButton(
        onPressed: () => buy(index, context),
        child: const Text(
          ' купить',
          style: TextsStyle.buy,
        ),
        style: ButtonsStyle.buy,
      );
    }
    return TextButton(
      onPressed: null,
      child: const Text(
        ' продано',
        style: TextsStyle.sold,
      ),
      style: ButtonsStyle.sold,
    );
  }

  Widget _buildGrid(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: SwitchState.quality? MainAxisAlignment.spaceAround: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(
                filteredProducts[index].name,
                style: TextsStyle.nameProduct,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          const SizedBox(
            height: 5,
          ),
          if (SwitchState.quality)  Expanded(
              child: Image.asset(
                ProductsInfoStatic.products[index].path,
                fit: BoxFit.cover,
              )),
          Align(
            alignment: Alignment.center,
              child: Text('\$ ${filteredProducts[index].price}',style: TextsStyle.price)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextProductExist(index),
              const SizedBox(
                width: 2,
              ),
              _buildTextButton(index),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2, crossAxisCount: 2),
            itemCount: filteredProducts.length,
            itemBuilder: _buildGrid,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                controller: _searchController,
                decoration: FindDecoration.findDecoration,
              ),
            ),
            Expanded(
                child: Switch.adaptive(
                    activeColor: ColorsRGB.switchColor,
                    value: SwitchState.quality,
                    onChanged: switchChanged))
          ],
        ),
      ],
    );
  }

  void switchChanged(bool quality) {
    SwitchState.quality = quality;
    setState(() {});
  }

  final _searchController = TextEditingController();

  void buy(int index, BuildContext context) {
    var product = ProductsInfoStatic.products[index];
    if (product.num > 0) {
      product.num--;
      basket.add(product);
    }
    context.findAncestorStateOfType<ScaffoldWidgetState>()?.setState(() {});
    setState(() {});
  }
}
