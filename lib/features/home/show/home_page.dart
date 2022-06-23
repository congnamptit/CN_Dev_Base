import 'package:cn_base/features/home/stfuls/category_image.dart';
import 'package:cn_base/features/home/stfuls/recommend.dart';
import 'package:cn_base/features/home/stless/category_icon_item.dart';
import 'package:cn_base/features/home/stfuls/flash_sale.dart';
import 'package:cn_base/features/home/stfuls/image_slider.dart';
import 'package:cn_base/features/home/stfuls/promotion_list.dart';
import 'package:cn_base/widgets/stless/app_bar/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 58 + statusBarHeight,),
                const ImageSlider(),
                const CategoryIconItem(),
                const Promotion(),
                const SizedBox(height: 30,),
                const FlashSale(),
                const CategoryImage(),
                const Recommend(),
              ],
            ),
          ),
          const AppBarCustom(),
        ],
      ),
    );
  }
}
