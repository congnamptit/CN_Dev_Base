extension StringExtentsion on String {

  /// Convert String to Double
  /// If error then return 0.0
  double? toDouble() {
    return double.tryParse(this);
  }
}
