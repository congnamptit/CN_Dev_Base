import 'package:cn_base/core/const/constants.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef SelectBoxBuilder<T> = Widget Function(T data);

class SelectBox<T> extends HookWidget {
  const SelectBox(
    this.iconSize, {
    Key? key,
    required this.daraSrc,
    required this.value,
    required this.itemBuilder,
    required this.onChanged,
  }) : super(key: key);
  final List<T> daraSrc;
  final T value;
  final SelectBoxBuilder<T> itemBuilder;
  final ValueChanged<T> onChanged;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        value: value,
        isExpanded: true,
        iconSize: iconSize ?? 30,
        itemHeight: 52,
        dropdownMaxHeight: 300,
        dropdownPadding: null,
        dropdownElevation: 8,
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        scrollbarRadius: const Radius.circular(40),
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        buttonPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        items: daraSrc.map<DropdownMenuItem<T>>((T data) {
          return DropdownMenuItem<T>(
            value: data,
            child: itemBuilder(data),
          );
        }).toList(),
        onChanged: (value) {
          if (value == null) return;

          onChanged(value);
        },
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cyan),
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cyan),
          color: AppColors.white,
        ),
      ),
    );
  }
}
