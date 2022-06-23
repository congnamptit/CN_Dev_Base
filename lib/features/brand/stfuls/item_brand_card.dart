import 'package:cn_base/features/brand/show/brand_detail.dart';
import 'package:cn_base/features/model/brand_model.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemBrandCard extends ConsumerWidget {
  const ItemBrandCard({Key? key, required this.brand}) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => BrandDetailPage(brand: brand),
                transitionDuration: const Duration(milliseconds: 600),
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return Opacity(
                    opacity: animation.value,
                    child: child,
                  );
                }),
            (route) => true,
          );
        },
        child: Container(
          height: 130,
          width: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Hero(
            tag: 'hero-tag-${brand.id}',
            transitionOnUserGestures: true,
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(brand.img),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFABABAB).withOpacity(0.3),
                      blurRadius: 1,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: TextViewApp(title: brand.name, fontSize: 36),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
