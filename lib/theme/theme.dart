library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'colors.dart';

part 'font_size.dart';

final kLightThemeData = ThemeData(
  brightness: Brightness.light,
  // Độ sáng app
  primarySwatch: AppColors.cyan,
  // màu chính app
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.cyan[100],
  hintColor: AppColors.grey,
  dividerTheme: const DividerThemeData(space: 1),
  // tùy chỉnh màu sắc, độ dày và thụt lề của Bộ chia, Bộ chia dọc
  scaffoldBackgroundColor: AppColors.cyan[50],
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.cyan,
      fontSize: 12,
    ),
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.cyan[50],
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
);

final kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.cyan[700],
  dividerTheme: const DividerThemeData(space: 1),
  scaffoldBackgroundColor: Colors.grey[700],
  toggleableActiveColor: AppColors.cyan,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.cyan,
      fontSize: 12,
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(primary: AppColors.cyan[400]),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.cyan[50],
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);

const _kAppBarTheme = AppBarTheme(
  centerTitle: true,
);
