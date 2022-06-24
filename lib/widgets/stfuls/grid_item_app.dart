import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../stless/text/text_view_app.dart';

class GridItemApp extends StatelessWidget {
  const GridItemApp({
    Key? key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.title,
    required this.img,
    required this.price,
    required this.ratting,
    required this.sale,
  }) : super(key: key);

  final VoidCallback onTap;
  final double height;
  final double width;
  final String title;
  final String img;
  final String price;
  final String ratting;
  final String sale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4,
                spreadRadius: 1,
              )
            ]),
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Hero(
                //   tag: "girl-${item.id}",
                //   child:
                Material(
                  child: InkWell(
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 1),
                      TextViewApp(
                        title: price,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextViewApp(
                                title: ratting,
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              )
                            ],
                          ),
                          TextViewApp(
                            title: sale,
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
