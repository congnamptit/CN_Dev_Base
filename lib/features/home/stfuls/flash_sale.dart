import 'package:cn_base/features/home/stfuls/splash_sale_item.dart';
import 'package:cn_base/widgets/stless/assets_gen/assets.gen.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'count_down_timer.dart';

class FlashSale extends HookConsumerWidget {
  const FlashSale({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      height: 390,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7F7FD5).withOpacity(0.8),
            const Color(0xFF86A8E7),
            const Color(0xFF91EAE4),
          ],
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: mediaQueryData.padding.left + 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.img.flashSaleIcon.path,
                    height: mediaQueryData.size.height * 0.08,
                  ),
                  const TextViewApp(
                    title: 'Flash',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  const TextViewApp(
                    title: 'Sale',
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: mediaQueryData.padding.top + 30),
                  const TextViewApp(
                    title: 'End Sale In:',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 2),
                  CountDownTime(
                    secondRemaining: 86400,
                    whenTimeExpires: () {},
                    countDownTimerStyle: const TextStyle(
                      fontFamily: "Sans",
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 40,),
          FlashSaleItem(
              image: Assets.imgItem.mackbook.path,
              title: "Apple Macbook Pro 13 with Touch Bar",
              normalPrice: "\$ 2,020",
              discountPrice: "\$ 1,300",
              ratingValue: "(56)",
              place: 'United Kingdom',
              stock: "9 Available",
              colorLine: 0xFFFFA500,
              widthLine: 50,
          ),
          const SizedBox(width: 10),
          FlashSaleItem(
              image: Assets.imgItem.flashSale2.path,
              title: "7 Level Karina Dress Sweet Pesta",
              normalPrice: "\$ 14",
              discountPrice: "\$ 10",
              ratingValue: "(16)",
              place: 'United Kingdom',
              stock: "24 Available",
              colorLine: 0xFF528640,
              widthLine: 100,
          ),
          const SizedBox(width: 10),
          FlashSaleItem(
              image: Assets.imgItem.flashSale3.path,
              title: "Samsung Galaxy Note 9 8GB - 512GB",
              normalPrice: "\$ 1000",
              discountPrice: "\$ 950",
              ratingValue: "(20)",
              place: 'United Kingdom',
              stock: "14 Available",
              colorLine: 0xFF52B640,
              widthLine: 90,
          ),
          const SizedBox(width: 10),
          FlashSaleItem(
              image: Assets.imgItem.flashSale4.path,
              title: "Harry Potter Spesial Edition ",
              normalPrice: "\$ 25",
              discountPrice: "\$ 20",
              ratingValue: "(22)",
              place: 'United Kingdom',
              stock: "5 Available",
              colorLine: 0xFFFFA500,
              widthLine: 30,
          ),
          const SizedBox(width: 10),
          FlashSaleItem(
              image: Assets.imgItem.flashSale5.path,
              title: "Pro Evolution Soccer 2019 Steam Original PC Games",
              normalPrice: "\$ 50",
              discountPrice: "\$ 30",
              ratingValue: "(10)",
              place: 'United Kingdom',
              stock: "30 Available",
              colorLine: 0xFF52B640,
              widthLine: 100,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}