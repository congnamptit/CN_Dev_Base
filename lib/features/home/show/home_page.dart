import 'package:cn_base/widgets/stless/app_bar/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: const [
          SingleChildScrollView(),
          AppBarCustom(),
        ],
      ),
    );
  }
}
