import 'package:flutter/material.dart';
import 'package:market/pages/main_page/util/images_name.dart';
import 'package:market/pages/main_page/util/products_info.dart';

class BodyShopWidget extends StatefulWidget {
  const BodyShopWidget({Key? key}) : super(key: key);

  @override
  State<BodyShopWidget> createState() => _BodyShopWidgetState();
}

class _BodyShopWidgetState extends State<BodyShopWidget> {
  int sum = 0;
  var filteredProducts = <ProductsInfo>[];
  var buyProducts = <ProductsInfo>[];
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

  Widget _buildTextProductExist(int index){
    int num = filteredProducts[index].num;
    if (num > 0) {
      return const Text('Есть в наличии');
    }
    return const Text('Нет в наличии');
  }

  Widget _buildTextButton(int index) {
    int num = filteredProducts[index].num;
    if (num > 0) {
      return TextButton(onPressed: () => buy(index, context), child: const Text('купить'));
    }
    return const TextButton(onPressed: null, child: Text('продано'),);
  }

  Widget buildGrid(BuildContext context, int index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(filteredProducts[index].name, maxLines: 1,),
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
              ],)
            ],
          ),
        ),
        TextField(controller: _searchController,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: filteredProducts.length,
        itemBuilder: buildGrid);
  }

  final _searchController = TextEditingController();

  void buy(int index, BuildContext context) {
    var product = products[index];
    if (product.num > 0) {
      print(product.num);
      product.num--;
      sum += product.price;
      buyProducts.add(product);
      print(buyProducts);
    } else {
      context.findAncestorWidgetOfExactType<TextButton>();
    }
    setState(() {});
  }
}
