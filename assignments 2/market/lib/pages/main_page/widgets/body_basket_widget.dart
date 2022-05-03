import 'package:flutter/material.dart';
import 'package:market/pages/main_page/widgets/scaffold_widget.dart';

import '../util/products_info.dart';


class BodyBasketWidget extends StatefulWidget {
  const BodyBasketWidget({Key? key}) : super(key: key);

  @override
  State<BodyBasketWidget> createState() => _BodyBasketWidgetState();
}

class _BodyBasketWidgetState extends State<BodyBasketWidget> {
  List<ProductsInfo> products = [];
  List<ProductsInfo> basket = [];


  void _cancel(int index) {
    var product = basket[index];
    basket.removeAt(index);
    if (products.contains(product)) {
      int i = products.indexOf(product);
      products[i].num++;
    }
    setState(() {

    });
  }

  void _buyAllProducts() {
    basket.clear();
    setState(() {

    });
  }


  Widget _buildGrid(BuildContext context, int index) {
    return Column(
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
        TextButton(
            onPressed: () => _cancel(index), child: Text('Отменить покупку'))
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
    products =
        context.dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!
            .products;
    basket =
        context.dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!
            .basket;

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemCount: basket.length,
              itemBuilder: _buildGrid),
        ),
        ElevatedButton(onPressed: _buyAllProducts, child: Text('Купить - ${calculateSum()}'))
      ],
    );
  }
}


