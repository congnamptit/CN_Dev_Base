import 'package:cn_base/widgets/stless/assets_gen/assets.gen.dart';

class RecommendItem {
  final String id;
  final String img;
  final String title;
  final String price;
  final String rattingValue;
  final String itemSale;
  final String description;

  RecommendItem({
    required this.id,
    required this.img,
    required this.title,
    required this.price,
    required this.rattingValue,
    required this.itemSale,
    required this.description,
  });
}

List<RecommendItem> listRecommend = [
  RecommendItem(
    id: "1",
    img: Assets.imgItem.fashion1.path,
    title: "Firrona Skirt!",
    price: "\$ 10",
    itemSale: "932 Sale",
    rattingValue: "4.8",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  RecommendItem(
    id: "2",
    img: Assets.imgItem.acesoris1.path,
    title: "Arpenaz 4 Family Camping",
    price: "\$ 200",
    itemSale: "892 Sale",
    rattingValue: "4.2",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  RecommendItem(
    id: "3",
    img: Assets.imgItem.beauty1.path,
    title: "Mizzu Valipcious Liner Vintage",
    price: "\$ 4",
    itemSale: "1422 Sale",
    rattingValue: "4.7",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  RecommendItem(
    id: "4",
    img: Assets.imgItem.man1.path,
    title: "MENTLI Solid Blue Slim Fit",
    price: "\$ 15",
    itemSale: "523 Sale",
    rattingValue: "4.4",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  RecommendItem(
    id: "5",
    img: Assets.imgItem.girl1.path,
    title: "Korea Choker The Black",
    price: "\$ 20",
    itemSale: "130 Sale",
    rattingValue: "4.5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  RecommendItem(
    id: "6",
    img: Assets.imgItem.kids1.path,
    title: "Mon Cheri Pinguin",
    price: "\$ 3",
    itemSale: "110 Sale",
    rattingValue: "4.8",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  RecommendItem(
    id: "7",
    img: Assets.imgItem.shoes1.path,
    title: "Dr. Kevin Women Casual Boots",
    price: "\$ 15",
    itemSale: "654 Sale",
    rattingValue: "4.1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  RecommendItem(
    id: "8",
    img: Assets.imgItem.shoes2.path,
    title: "Gino Mariani Zenon",
    price: "\$ 100",
    itemSale: "1542 Sale",
    rattingValue: "4.1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
];
