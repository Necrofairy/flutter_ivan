class ItemModel {
  int num;
  int count;
  final int price;
  final String name;
  final String mainImage;
  final String descriptionImage;
  final String description;

  ItemModel(
      {required this.name,
      required this.price,
      required this.mainImage,
      required this.descriptionImage,
      required this.description,
      required this.num, this.count = 0
      });
}
