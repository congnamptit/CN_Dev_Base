import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';

import '../stless/category_image_item.dart';

class CategoryImage extends StatelessWidget {
  const CategoryImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      color: AppColors.white,
      child: GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 17.0,
        childAspectRatio: 0.545,
        crossAxisCount: 2,
        scrollDirection: Axis.horizontal,
        primary: false,
        children: listCategoryImage.map((item) {
          return InkWell(
            onTap: item.tap,
            child: Container(
              height: 105.0,
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                image: DecorationImage(
                    image: AssetImage(item.image), fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                  color: Colors.black.withOpacity(0.25),
                ),
                child: Center(
                  child: TextViewApp(
                    title: item.title,
                    fontSize: 18,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
