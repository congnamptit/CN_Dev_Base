import 'package:cn_base/widgets/stfuls/carousel_pro/carousel_pro.dart';
import 'package:cn_base/widgets/stless/assets_gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ImageSlider extends HookWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Carousel(
        boxFit: BoxFit.cover,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowSize: 0.9,
        overlayShadowColors: Colors.white.withOpacity(0.9),
        dotSize: 6,
        dotSpacing: 16,
        dotBgColor: Colors.transparent,
        dotColor: const Color(0xFF6991C7).withOpacity(0.8),
        images: [
          AssetImage(Assets.img.baner1.path),
          AssetImage(Assets.img.baner12.path),
          AssetImage(Assets.img.baner2.path),
          AssetImage(Assets.img.baner3.path),
          AssetImage(Assets.img.baner4.path),
        ],
      ),
    );
  }
}
