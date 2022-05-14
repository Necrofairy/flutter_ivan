import 'package:market2/models/item_model.dart';
import 'package:market2/utils/images_path.dart';

abstract class Items {
  static final List<ItemModel> items = [
    ItemModel(
        name:
            'Ноутбук Acer Aspire 7 A715-42G-R0VS (NH.QBFEU.00A) Charcoal Black',
        price: 25000,
        mainImage: ImagesPath.image1a,
        descriptionImage: ImagesPath.image1b,
        description:
            'Экран 15.6" IPS (1920x1080) Full HD, матовый / AMD Ryzen 5 5500U (2.1 - 4.0 ГГц) / RAM 8 ГБ / SSD 512 ГБ / nVidia GeForce GTX 1650, 4 ГБ / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / без ОС / 2.15 кг / черный',
        num: 20),
    ItemModel(
        name:
            'Ноутбук ASUS Laptop X415FA-EB013 (90NB0W12-M00150) Slate Grey / 14" IPS / Intel Core i3-10110U / RAM 8 ГБ / SSD 256 ГБ',
        price: 30000,
        mainImage: ImagesPath.image2a,
        descriptionImage: ImagesPath.image2b,
        description:
            'Экран 14" IPS (1920x1080) Full HD, матовый / Intel Core i3-10110U (2.1 - 4.1 ГГц) / RAM 8 ГБ / SSD 256 ГБ / Intel UHD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / без ОС / 1.6 кг / серый',
        num: 30),
    ItemModel(
        name: 'Ноутбук Lenovo IdeaPad 3 15IIL05 (81WE012VRA) Platinum Grey',
        price: 23999,
        mainImage: ImagesPath.image3a,
        descriptionImage: ImagesPath.image3b,
        description:
            'Экран 15.6" TN+film (1920x1080) Full HD, матовый / Intel Core i3-1005G1 (1.2 - 3.4 ГГц) / RAM 8 ГБ / HDD 1 ТБ / nVidia GeForce MX330, 2 ГБ / без ОД / Wi-Fi / Bluetooth / веб-камера / DOS / 1.85 кг / серый',
        num: 25),
    ItemModel(
        name: 'Ноутбук HP Pavilion Gaming 15-ec2013ua (4A7M9EA) Shadow Black',
        price: 35999,
        mainImage: ImagesPath.image4a,
        descriptionImage: ImagesPath.image4b,
        description:
            'Экран 15.6" IPS (1920x1080) Full HD, матовый / AMD Ryzen 5 5600H (3.3 - 4.2 ГГц) / RAM 8 ГБ / SSD 512 ГБ / nVidia GeForce GTX 1650, 4 ГБ / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / DOS / 1.98 кг / черный',
        num: 15),
    ItemModel(
        name: 'Ноутбук Lenovo V17 G2 ITL (82NX00DCRA) Iron Grey',
        price: 27999,
        mainImage: ImagesPath.image5a,
        descriptionImage: ImagesPath.image5b,
        description:
            'Экран 17.3" TN+film (1600x900) HD+, матовый / Intel Pentium Gold 7505 (2.0 - 3.5 ГГц) / RAM 4 ГБ / SSD 256 ГБ / Intel UHD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / без ОС / 2.2 кг / серый',
        num: 0),
    ItemModel(
        name: 'Ноутбук Acer Swift 1 SF114-34-C4RG (NX.A77EU.00C) Pure Silver',
        price: 56999,
        mainImage: ImagesPath.image6a,
        descriptionImage: ImagesPath.image6b,
        description:
            'Экран 14" IPS (1920x1080) Full HD, матовый / Intel Celeron N4500 (1.1 - 2.8 ГГц) / RAM 8 ГБ / SSD 128 ГБ / Intel UHD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / без ОС / 1.3 кг / серебристый',
        num: 10),
    ItemModel(
        name:
            'Ноутбук ASUS TUF Gaming F15 FX506HCB-HN161 (90NR0723-M04940) Eclipse Gray / 15.6" IPS / Intel Core i5-11400H / RAM 16 ГБ / SSD 512 ГБ / nVidia GeForce RTX 3050',
        price: 50000,
        mainImage: ImagesPath.image7a,
        descriptionImage: ImagesPath.image7b,
        description:
            'Экран 15.6" IPS (1920x1080) Full HD 144 Гц, матовый / Intel Core i5-11400H (2.7 - 4.5 ГГц) / RAM 16 ГБ / SSD 512 ГБ / nVidia GeForce RTX 3050, 4 ГБ / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / без ОС / 2.3 кг / серый',
        num: 4),
    ItemModel(
        name: 'Ноутбук Lenovo IdeaPad 3 14ITL6 (82H700L0RA) Arctic Grey',
        price: 49999,
        mainImage: ImagesPath.image8a,
        descriptionImage: ImagesPath.image8b,
        description:
            'Экран 14" TN (1920x1080) Full HD, матовый / Intel Pentium Gold 7505 (2.0 - 3.5 ГГц) / RAM 4 ГБ / SSD 128 ГБ / Intel UHD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / Windows 10 Home 64bit / 1.41 кг / серый',
        num: 6),
    ItemModel(
        name: 'Ноутбук HP Pavilion Gaming 15-ec2024ua (5A0U9EA) Shadow Black',
        price: 35000,
        mainImage: ImagesPath.image9a,
        descriptionImage: ImagesPath.image9b,
        description:
            'Экран 15.6" IPS (1920x1080) Full HD 144 Гц, матовый / AMD Ryzen 7 5800H (3.2 - 4.4 ГГц) / RAM 16 ГБ / SSD 512 ГБ / nVidia GeForce RTX 3050 Ti, 4 ГБ / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / DOS / 1.98 кг / черный',
        num: 7),
  ];
}
