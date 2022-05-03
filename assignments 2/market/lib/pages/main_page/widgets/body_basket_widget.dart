import 'package:flutter/material.dart';
import 'package:market/pages/main_page/widgets/scaffold_widget.dart';

import '../util/products_info.dart';


class BodyBasketWidget extends StatefulWidget {
  BodyBasketWidget({Key? key}) : super(key: key);

  @override
  State<BodyBasketWidget> createState() => _BodyBasketWidgetState();
}

class _BodyBasketWidgetState extends State<BodyBasketWidget> {
  List<ProductsInfo> products = [];
  List<ProductsInfo> basket = [];


  void cancel(int index) {
    var product = basket[index];
    basket.removeAt(index);
    if (products.contains(product)) {
     int i = products.indexOf(product);
     products[i].num++;
    }
    setState(() {

    });
  }

  Widget _buildGrid(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              basket[index].name,
              maxLines: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: 200,
                  minHeight: 200,
                  maxWidth: 200,
                  maxHeight: 200),
              child: basket[index].image),
          Text('\$ ${basket[index].price}'),
          TextButton(onPressed: () => cancel(index), child: Text('Отменить покупку'))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    products = context.dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!.products;
    basket = context.dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!.basket;
    return GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: basket.length,
        itemBuilder: _buildGrid);
  }
}


