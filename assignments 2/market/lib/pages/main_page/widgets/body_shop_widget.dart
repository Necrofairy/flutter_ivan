import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/products_info.dart';
import 'package:market/pages/main_page/widgets/scaffold_widget.dart';

class BodyShopWidget extends StatefulWidget {
  const BodyShopWidget({Key? key}) : super(key: key);

  @override
  State<BodyShopWidget> createState() => BodyShopWidgetState();
}

class BodyShopWidgetState extends State<BodyShopWidget> {
  int sum = 0;
  List<ProductsInfo> products = [];
  List<ProductsInfo> basket = [];
  var filteredProducts = <ProductsInfo>[];
  
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchProduct);
    filteredProducts = products;
  }

  void _searchProduct() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      filteredProducts = products.where((ProductsInfo product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      if (filteredProducts.isEmpty) {
        filteredProducts = products;
      }
    } else {
      filteredProducts = products;
    }
    setState(() {});
  }

  Widget _buildTextProductExist(int index) {
    int num = filteredProducts[index].num;
    if (num > 0) {
      return const Text('Есть в наличии');
    }
    return const Text('Нет в наличии');
  }

  Widget _buildTextButton(int index) {
    int num = filteredProducts[index].num;
    if (num > 0) {
      return TextButton(
          onPressed: () => buy(index, context), child: const Text('купить'));
    }
    return const TextButton(
      onPressed: null,
      child: Text('продано'),
    );
  }

  Widget _buildGrid(BuildContext context, int index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  filteredProducts[index].name,
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
                  child: filteredProducts[index].image),
              Text('\$ ${filteredProducts[index].price}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextProductExist(index),
                  _buildTextButton(index),
                ],
              )
            ],
          ),
        ),
        TextField(
          controller: _searchController,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    products = context.dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!.products;
    filteredProducts = products;
    basket = context.dependOnInheritedWidgetOfExactType<ProductsProviderInherit>()!.basket;
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: filteredProducts.length,
        itemBuilder: _buildGrid);
  }

  final _searchController = TextEditingController();

  void buy(int index, BuildContext context) {
    var product = products[index];
    if (product.num > 0) {
      product.num--;
      sum += product.price;
      basket.add(product);
    } else {
      context.findAncestorWidgetOfExactType<TextButton>();
    }
    setState(() {});
  }
}
