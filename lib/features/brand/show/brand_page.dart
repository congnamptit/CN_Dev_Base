import 'package:cn_base/features/brand/stfuls/item_brand_card.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/theme.dart';
import '../../model/brand_model.dart';

class BrandPage extends HookConsumerWidget {
  BrandPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        color: AppColors.white,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 0),
              sliver: SliverFixedExtentList(
                itemExtent: 145,
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemBrandCard(brand: brandData[index]),
                  childCount: brandData.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _appBar = AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    title: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextViewApp(
        title: 'Category Brand',
        fontSize: 20,
        color: Colors.black54,
        fontWeight: FontWeight.w700,
      ),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.search,
            size: 27,
            color: Colors.black54,
          ),
        ),
      ),
    ],
  );
}
