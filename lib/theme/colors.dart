// NOTE: To create an original color panel,
//specify the base color at the following site.
// http://mcg.mbitson.com

part of app_theme;

class AppColors {
  AppColors._();

  static const MaterialColor cyan = MaterialColor(
    _cyanPrimaryValue,
    <int, Color>{
      50: Color(0xFFE0F7FA),
      100: Color(0xFFB2EBFE),
      200: Color(0xFF80DEEA),
      300: Color(0xFF4DD0E1),
      400: Color(0xFF26C6DA),
      500: Color(_cyanPrimaryValue),
      600: Color(0xFF00ACC1),
      700: Color(0xFF0097A7),
      800: Color(0xFF00838F),
      900: Color(0xFF006064),
    },
  );
  static const int _cyanPrimaryValue = 0xFF87CEEB;

  static const MaterialColor blueAccent = MaterialColor(
    _blueAccent,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(_blueAccent),
      400: Color(0xFFDAF2FF),
      700: Color(0xFFC1EAFF),
    },
  );

  static const int _blueAccent = 0xFFFFFFFF;

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  static const Color pink = Color(0xFFeab9bc);

  static const Color grey = Color(0xFF9E9E9E);

  static const Color red = Color(0xFFDB2424);

  static const Color orange = Color(0xFFFF6500);

  static const Color green = Color(0xFF4CAF50);
}
