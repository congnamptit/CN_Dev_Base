import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';

class FlashSaleItem extends StatelessWidget {
  final String image;
  final String title;
  final String normalPrice;
  final String discountPrice;
  final String ratingValue;
  final String place;
  final String stock;
  final int colorLine;
  final double widthLine;

  const FlashSaleItem({
    Key? key,
    required this.image,
    required this.title,
    required this.normalPrice,
    required this.discountPrice,
    required this.ratingValue,
    required this.place,
    required this.stock,
    required this.colorLine,
    required this.widthLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                height: 310,
                width: 145,
                color: AppColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 140,
                      width: 145,
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 15,
                      ),
                      child: TextViewApp(
                        title: title,
                        fontSize: 10,
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                      ),
                      child: Text(
                        normalPrice,
                        style: const TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                      ),
                      child: TextViewApp(
                        title: discountPrice,
                        fontSize: 10,
                        color: const Color(0xFF7F7FD5),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star_half,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          TextViewApp(
                            title: ratingValue,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 10,
                            color: Colors.black38,
                          ),
                          TextViewApp(
                            title: place,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                      ),
                      child: TextViewApp(
                        title: stock,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 4,
                      ),
                      child: Container(
                        height: 5,
                        width: widthLine,
                        decoration: BoxDecoration(
                          color: Color(colorLine),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
