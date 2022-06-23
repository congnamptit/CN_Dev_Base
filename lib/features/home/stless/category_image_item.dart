import 'package:cn_base/widgets/stless/assets_gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CategoryImageItem {
  final String image;
  final String title;
  final GestureTapCallback tap;

  const CategoryImageItem({
    Key? key,
    required this.image,
    required this.title,
    required this.tap,
  });
}

final List<CategoryImageItem> listCategoryImage = [
  CategoryImageItem(
    image: Assets.imgItem.category2.path,
    title: "Fashion Man",
    tap: () {},
  ),
  CategoryImageItem(
    image: Assets.imgItem.category1.path,
    title: "Fashion Girl",
    tap: () {},
  ),
  CategoryImageItem(
    image: Assets.imgItem.category3.path,
    title: "Smartphone",
    tap: () {},
  ),
  CategoryImageItem(
    image: Assets.imgItem.category4.path,
    title: "Computer",
    tap: () {},
  ),
  CategoryImageItem(
    image: Assets.imgItem.category5.path,
    title: "Sport",
    tap: () {},
  ),
  CategoryImageItem(
    image: Assets.imgItem.category7.path,
    title: "health",
    tap: () {},
  ),
  CategoryImageItem(
    image: Assets.imgItem.category6.path,
    title: "Fashion Kids",
    tap: () {},
  ),
  CategoryImageItem(
    image: Assets.imgItem.category8.path,
    title: "Makeup",
    tap: () {},
  ),
];
