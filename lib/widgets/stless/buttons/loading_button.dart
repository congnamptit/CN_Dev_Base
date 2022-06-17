part of base_button;

class LoadingButton extends HookWidget {
  const LoadingButton(
    this.title, {
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.buttonType = ButtonType.primary,
    this.buttonSize = ButtonSize.medium,
    this.enabled = true,
    this.child,
    this.padding,
  }) : super(key: key);

  final String title;
  final Future Function() onPressed;
  final VoidCallback? onLongPress;

  final ButtonType buttonType;
  final ButtonSize buttonSize;

  final bool enabled;
  final Widget? child;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return LazyFutureBuilder(
      lazyFuture: () async {
        await onPressed();
      },
      builder: (context, future, isFutureExecuting) {
        return Button(
          title,
          onPressed: future,
          buttonType: buttonType,
          buttonSize: buttonSize,
          padding: padding,
          onLongPress: onPressed,
          child: isFutureExecuting
              ? Indicator(
                  radius: buttonSize.indicatorSize,
                  color: buttonType.indicatorColor(themeData),
                )
              : child,
        );
      },
    );
  }
}
