import 'package:cn_base/features/home/stless/recommend_item.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';

class Recommend extends StatelessWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: TextViewApp(
              title: 'Recommend',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 17.0,
            childAspectRatio: 0.545,
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            primary: false,
            children: listRecommend.map((item) {
              return InkWell(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
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
                          Hero(
                            tag: "girl-${item.id}",
                            child: Material(
                              child: InkWell(
                                child: Container(
                                  height: mediaQuery.size.height / 3.3,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(item.img),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
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
                                  title: item.price,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextViewApp(
                                          title: item.rattingValue,
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
                                      title: item.itemSale,
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
            }).toList(),
          ),
        ],
      ),
    );
  }
}
