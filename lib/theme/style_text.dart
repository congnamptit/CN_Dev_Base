///
/// Defines constants related to [Text()].
///

part of app_theme;

class StyleText {
  StyleText._();

  static var customTextStyleBlack = const TextStyle(
    fontFamily: "Gotik",
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 15.0,
  );
  static var customTextStyleBlue = const TextStyle(
    fontFamily: "Gotik",
    color: Color(0xFF6991C7),
    fontWeight: FontWeight.w700,
    fontSize: 15.0,
  );
  static var fontCustomSheetBottomHeader = const TextStyle(
    fontFamily: "Berlin",
    color: Colors.black54,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
  static var fontCustomSheetBottom = const TextStyle(
    fontFamily: "Sans",
    color: Colors.black45,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );
}
