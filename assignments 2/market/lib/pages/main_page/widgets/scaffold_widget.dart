import 'package:flutter/material.dart';
import 'package:market/pages/main_page/widgets/body_basket_widget.dart';
import 'package:market/pages/main_page/widgets/body_shop_widget.dart';

import '../util/images_name.dart';
import '../util/products_info.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int select = 0;
  var basket = <ProductsInfo>[];
  var products = <ProductsInfo>[
    ProductsInfo(
        image: Image.asset(ImagesName.product1),
        name: 'Корпус RZTK PcCooler Master RP200 Mesh RGB 3F',
        num: 10,
        price: 1500),
    ProductsInfo(
        image: Image.asset(ImagesName.product2),
        name: 'Блок питания ASUS TUF Gaming 750W 80+ Bronze (TUF-GAMING-750B)',
        num: 20,
        price: 2000),
    ProductsInfo(
        image: Image.asset(ImagesName.product3),
        name:
            'Samsung 860 Evo-Series 250GB M.2 SATA III V-NAND MLC (MZ-N6E250BW)',
        num: 10,
        price: 2500),
    ProductsInfo(
        image: Image.asset(ImagesName.product4),
        name:
            'AFOX PCI-Ex GeForce GTX1060 6GB GDDR5 (192bit) (1708/8000) (DVI, HDMI, DisplayPort) (AF1060-6144D5H7)',
        num: 5,
        price: 3000),
    ProductsInfo(
        image: Image.asset(ImagesName.product5),
        name:
            'Жесткий диск Western Digital Purple Pro 8TB 7200rpm 256MB WD8001PURP 3.5 SATA III',
        num: 7,
        price: 1999),
    ProductsInfo(
        image: Image.asset(ImagesName.product6),
        name:
            'MSI PCI-Ex GeForce GT 730 2GB DDR3 (64bit) (902/1600) (D-Sub, DVI-D Dual Link, HDMI) (N730K-2GD3H/LPV1)',
        num: 2,
        price: 4999),
    ProductsInfo(
        image: Image.asset(ImagesName.product7),
        name: 'Аккумуляторная батарея Matrix 12V 5Ah (NP5-12)',
        num: 4,
        price: 3999),
    ProductsInfo(
        image: Image.asset(ImagesName.product8),
        name:
            'MSI PCI-Ex GeForce RTX 3070 Ti VENTUS 3X 8G 8GB GDDR6X (256bit) (1770/19000) (HDMI, 3 x DisplayPort) (RTX 3070 Ti VENTUS 3X 8G)',
        num: 7,
        price: 7400),
    ProductsInfo(
        image: Image.asset(ImagesName.product9),
        name: 'Корпус Lian Li Lancool ONE Digital Black (G99.LANONE-D.X0)',
        num: 0,
        price: 15000),
    ProductsInfo(
        image: Image.asset(ImagesName.product10),
        name:
            'Процессор Intel Core i3-10100F 3.6GHz/6MB (BX8070110100F) s1200 BOX',
        num: 1,
        price: 10000)
  ];

  void onSelect(int index) {
    setState(() {
      select = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TechnoShop',
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              letterSpacing: 3,
              shadows: <Shadow>[
                Shadow(
                    offset: Offset(-1, -1), blurRadius: 3, color: Colors.black)
              ]),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ProductsProviderInherit(
        basket: basket,
        products: products,
        child: IndexedStack(
          index: select,
          children: [BodyShopWidget(), BodyBasketWidget()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: select,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded), label: 'Basket')
          ],
          onTap: onSelect),
    );
  }
}

class ProductsProviderInherit extends InheritedWidget {
  List<ProductsInfo> basket;
  List<ProductsInfo> products;

  ProductsProviderInherit({
    Key? key,
    required this.products,
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
    return  old.basket != basket || old.products != products;
  }
}
