import 'package:cn_base/widgets/stless/assets_gen/assets.gen.dart';

class Brand {
  final String id;
  final String name;
  final String img;
  final String desc;
  final Items item;

   Brand({
    required this.img,
    required this.id,
    required this.name,
    required this.desc,
    required this.item,
  });
}

class Items {
  final String itemName;
  final String itemPrice;
  final String itemRatting;
  final String itemsale;
  final String itemId;
  final String itemImg;

   Items({
    required this.itemName,
    required this.itemPrice,
    required this.itemRatting,
    required this.itemsale,
    required this.itemId,
    required this.itemImg,
  });
}

List<Brand> brandData = [
   Brand(
    name: "Nike Sport",
    id: "1",
    img: Assets.imgBrand.nikeHeader.path,
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item:  Items(
      itemImg: Assets.imgBrand.brandNike.path,
      itemId: "1",
      itemName: "Nike Sport Shoes Running Man Blue Black",
      itemPrice: "\$ 100",
      itemRatting: "4.5",
      itemsale: "200 Sale",
    ),
  ),
   Brand(
    name: "Apple Tech",
    id: "2",
    img: Assets.imgBrand.appleHeader.path,
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: Items(
      itemImg: Assets.imgBrand.brandApple.path,
      itemId: "1",
      itemName: "Mackbook Pro SSD 500 GB",
      itemPrice: "\$ 1500",
      itemRatting: "4.5",
      itemsale: "250 Sale",
    ),
  ),
   Brand(
    name: "Fendi Fashion",
    id: "3",
    img: Assets.imgBrand.fendiHeader.path,
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: Items(
      itemImg: Assets.imgItem.fashion1.path,
      itemId: "1",
      itemName: "Fendi Fashion",
      itemPrice: "\$ 250",
      itemRatting: "4.5",
      itemsale: "200 Sale",
    ),
  ),
   Brand(
    name: "Gucci Fashion",
    id: "4",
    img: Assets.imgBrand.gucciHeader.path,
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: Items(
      itemImg: Assets.imgItem.flashSale2.path,
      itemId: "1",
      itemName: "Dress Swite For Girl Brown",
      itemPrice: "\$ 100",
      itemRatting: "4.5",
      itemsale: "200 Sale",
    ),
  ),
   Brand(
    name: "Samsung Tech",
    id: "5",
    img: Assets.imgBrand.samsungHeader.path,
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: Items(
      itemImg: Assets.imgPromo.imgPromo2.path,
      itemId: "1",
      itemName: "Samsung Galaxy S8+ 256 GB",
      itemPrice: "\$ 800",
      itemRatting: "4.5",
      itemsale: "200 Sale",
    ),
  ),
   Brand(
    name: "Sony Tech",
    id: "6",
    img: Assets.imgBrand.sonyHeader.path,
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: Items(
      itemImg: Assets.imgPromo.imgPromo8.path,
      itemId: "1",
      itemName: "SmartWarch Sonny",
      itemPrice: "\$ 100",
      itemRatting: "4.5",
      itemsale: "200 Sale",
    ),
  ),
];
