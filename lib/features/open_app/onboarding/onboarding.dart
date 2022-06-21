import 'package:cn_base/core/utils/utils.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class OnBoardingPage extends HookConsumerWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              highlightColor: AppColors.blueAccent,
              baseColor: AppColors.cyan,
              child: TextView(
                'Base With Me',
                fontSize: Responsive.isMobile ? FontSize.massive : 40,
                fontWeight: FontWeight.bold,
              ),

            )
          ],
        ),
      ),
    );
  }
}
