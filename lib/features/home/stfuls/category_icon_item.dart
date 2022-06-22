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
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: data.listIcon.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              mainAxisExtent: 65,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Image.asset(data.listIcon[index].icon,
                    height: 30,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextViewApp(
                      title: data.listIcon[index].title,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
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
