import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/products_info_static.dart';
import 'package:market/pages/main_page/widgets/scaffold_widget.dart';

import '../util/buttons_style.dart';
import '../util/products_info.dart';
import '../util/texts_style.dart';

class BodyBasketWidget extends StatefulWidget {
  const BodyBasketWidget({Key? key}) : super(key: key);

  @override
  State<BodyBasketWidget> createState() => _BodyBasketWidgetState();
}

class _BodyBasketWidgetState extends State<BodyBasketWidget> {
  List<ProductsInfo> basket = [];

  void _cancel(int index) {
    var product = basket[index];
    basket.removeAt(index);
    if (ProductsInfoStatic.products.contains(product)) {
      int i = ProductsInfoStatic.products.indexOf(product);
      ProductsInfoStatic.products[i].num++;
    }
    setState(() {});
  }

  void _buyAllProducts() {
    basket.clear();
    setState(() {});
  }

  void _cancelAll() {
    if (basket.isNotEmpty) {
      for (var product in basket) {
        int i = ProductsInfoStatic.products.indexOf(product);
        ProductsInfoStatic.products[i].num++;
      }
      basket.clear();
    }
    setState(() {});
  }

  Widget _buildGrid(BuildContext context, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            basket[index].name,
            maxLines: 2,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(child: Image.asset(basket[index].path, fit: BoxFit.cover,)),
        Text('\$ ${basket[index].price}'),
        TextButton(
          onPressed: () => _cancel(index),
          child: const Text(
            'Отменить покупку',
            style: TextsStyle.cancel,
          ),
          style: ButtonsStyle.cancel,
        )
      ],
    );
  }

  int calculateSum() {
    int sum = 0;
    for (var product in basket) {
      sum += product.price;
    }
    return sum;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    basket = context
        .dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!
        .basket;

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: basket.length,
              itemBuilder: _buildGrid),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _buyAllProducts,
                child: Text('Купить - ${calculateSum()}'),
                style: ButtonsStyle.buyAll,
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: _cancelAll,
                child: const Text('Отменить'),
                style: ButtonsStyle.cancelAll,
              ),
            )
          ],
        )
      ],
    );
  }
}
