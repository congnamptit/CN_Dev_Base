import 'package:cn_base/router/router.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../brand_view_model.dart';
import '../../model/brand_model.dart';

class BrandDetailPage extends ConsumerWidget {
  BrandDetailPage({
    Key? key,
    required this.brand,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Brand brand;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String notif = 'Notification';
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double _height = MediaQuery.of(context).size.height;

    final updateState = ref.read(brandVMProvider);

    return Scaffold(
      key: _key,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                expandedHeight: _height - 40,
                img: brand.img,
                title: brand.name,
                id: brand.id,
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          height: 300,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppColors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 30, right: 20),
                                child: TextViewApp(
                                  title: brand.desc,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 40),
                              ButtonCustom(
                                txt: 'Message',
                                color: Colors.blue,
                                onTap: () {},
                              ),
                              const SizedBox(height: 10),
                              ButtonCustom(
                                txt: notif,
                                color: Colors.indigoAccent,
                                onTap: () {
                                  var snackBar = SnackBar(
                                    content: Text(brand.name + 'Notificated'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        if (notif == 'Notifications') {
                                          notif = 'Notificated';
                                        } else {
                                          notif == 'Notifications';
                                        }
                                        updateState;
                                      },
                                    ),
                                  );
                                  if (notif == "Notifications") {
                                    notif = "Notificated";
                                  } else {
                                    // ignore: unnecessary_statements
                                    (notif = "Notifications");
                                  }
                                  updateState;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (builder) {
                                      return const BottomSheetSort();
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    const Expanded(
                                        child: Icon(Icons.arrow_drop_down)),
                                    // const SizedBox(height: 10),
                                    Expanded(
                                      child: Text(
                                        'Sort',
                                        style: StyleText
                                            .fontCustomSheetBottomHeader,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 45,
                                  width: 1,
                                  decoration: const BoxDecoration(
                                      color: Colors.black12),
                                ),
                              ],
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (builder) {
                                        return const BottomSheetRefine();
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.arrow_drop_down),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Notification',
                                      style:
                                          StyleText.fontCustomSheetBottomHeader,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Create Grid Item
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF656565).withOpacity(0.15),
                            blurRadius: 4,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: mediaQueryData.size.height / 3.5,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(brand.item.itemImg),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  brand.item.itemName,
                                  style: const TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextViewApp(
                                  title: brand.item.itemPrice,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  top: 5,
                                  right: 15,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextViewApp(
                                          title: brand.item.itemRatting,
                                          color: Colors.black26,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                    TextViewApp(
                                      title: brand.item.itemsale,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
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
                },
                childCount: 12,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                childAspectRatio: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetRefine extends StatelessWidget {
  const BottomSheetRefine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'REFINE BY',
              style: StyleText.fontCustomSheetBottomHeader,
            ),
            const SizedBox(height: 20),
            Container(
              width: 500,
              color: Colors.black26,
              height: 5,
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                AppRouter().push(const RootRoute());
              },
              child: Text(
                'Popularity',
                style: StyleText.fontCustomSheetBottom,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'New',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
            Text(
              'Discount',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
            Text(
              'Price Low',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
            Text(
              'Price Hight',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class BottomSheetSort extends StatelessWidget {
  const BottomSheetSort({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'SORT BY',
              style: StyleText.fontCustomSheetBottomHeader,
            ),
            const SizedBox(height: 20),
            Container(
              width: 500,
              color: Colors.black26,
              height: 5,
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                AppRouter().push(const RootRoute());
              },
              child: Text(
                'Popularity',
                style: StyleText.fontCustomSheetBottom,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'New',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
            Text(
              'Discount',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
            Text(
              'Price Low',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
            Text(
              'Price Hight',
              style: StyleText.fontCustomSheetBottom,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  MySliverAppBar({
    required this.expandedHeight,
    required this.img,
    required this.id,
    required this.title,
  });

  final double expandedHeight;
  final String img;
  final String title;
  final String id;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      fit: StackFit.expand,
      children: [
        Container(
          height: 50,
          width: double.infinity,
          color: AppColors.white,
          alignment: Alignment.center,
        ),
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Hero(
            tag: 'hero-tag-$id',
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 130),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF)],
                    stops: [0.0, 1.0],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(0, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextViewApp(
                title: title,
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: (expandedHeight / 40) - (shrinkOffset / 40) + 18,
              ),
            ),
            const SizedBox(
              width: 36,
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    required this.txt,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String txt;
  final Color color;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.0,
        width: 300.0,
        decoration: BoxDecoration(color: color),
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(color: Colors.white, fontFamily: "Sans"),
          ),
        ),
      ),
    );
  }
}
