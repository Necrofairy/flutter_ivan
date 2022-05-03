import 'package:flutter/material.dart';
import 'package:market/pages/main_page/widgets/body_shop_widget.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int select = 0;
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
      body: IndexedStack(
        index: select,
        children: [
          BodyShopWidget(),
          Text('test')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: select ,items: const [
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: 'Basket')
      ],onTap: onSelect
      ),
    );
  }
}
