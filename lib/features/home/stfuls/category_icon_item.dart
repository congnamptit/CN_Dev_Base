import 'package:cn_base/features/home/view_model/home_page_view_model.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryIconItem extends HookConsumerWidget {
  const CategoryIconItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(homeVMProvider);
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextViewApp(
              title: 'menu',
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            semanticChildCount: 4,
            itemCount: data.listIcon.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Expanded(child: Image.asset(data.listIcon[index].icon)),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: TextViewApp(
                        title: data.listIcon[index].title,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategoryIcon {
  const CategoryIcon({required this.icon, required this.title});

  final String icon;
  final String title;
}
