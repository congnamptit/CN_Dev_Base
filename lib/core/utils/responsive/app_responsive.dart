part of utils;

class AppResponsive extends HookWidget {
  const AppResponsive({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Responsive.setResponsive(constraints, orientation);

        return child;
      });
    });
  }
}
