import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/texts_style.dart';
import 'package:market/pages/main_page/widgets/body_basket_widget.dart';
import 'package:market/pages/main_page/widgets/body_shop_widget.dart';

import '../util/images_name.dart';
import '../util/products_info.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<ScaffoldWidget> createState() => ScaffoldWidgetState();
}

class ScaffoldWidgetState extends State<ScaffoldWidget> {
  int select = 0;
  var basket = <ProductsInfo>[];

  void onSelect(int index) {
    setState(() {
      select = index;
    });
  }
  List<Widget> widgets = [const BodyShopWidget(), const BodyBasketWidget()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TechnoShop',
          style: TextsStyle.title
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ProductsProviderInherit(
        basket: basket,
        child: widgets[select],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: select,
          items:  [
            const BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_rounded), label: 'Basket - ${basket.length}')
          ],
          onTap: onSelect),
    );
  }
}

class ProductsProviderInherit extends InheritedWidget {
  final  List<ProductsInfo> basket;

  const ProductsProviderInherit({
    Key? key,
    required this.basket,
    required Widget child,
  }) : super(key: key, child: child);

  static ProductsProviderInherit of(BuildContext context) {
    final ProductsProviderInherit? result =
        context.dependOnInheritedWidgetOfExactType<ProductsProviderInherit>();
    assert(result != null, 'No ProductsProviderInherit found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductsProviderInherit old) {
    return old.basket != basket;
  }
}
