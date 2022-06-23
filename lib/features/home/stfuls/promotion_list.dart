import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../widgets/stless/assets_gen/assets.gen.dart';

class Promotion extends HookWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      alignment: AlignmentDirectional.centerStart,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 3, right: 20),
            child: TextViewApp(
              title: 'Week Promotion',
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, left: 10),
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Image.asset(Assets.imgPromo.discount1.path),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Image.asset(Assets.imgPromo.discount2.path),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Image.asset(Assets.imgPromo.discount3.path),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Image.asset(Assets.imgPromo.discount4.path),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Image.asset(Assets.imgPromo.discount5.path),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Image.asset(Assets.imgPromo.discount6.path),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
