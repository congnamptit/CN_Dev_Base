part of utils;

/// Rút ngắn giá sản phẩm
class ConvertNumber {
  static String shortenPriceProduct(double price) {
    if (price < 1000) return  removeLastDot0(price.toString()) + "Đ";

    if (price < 1000000) {
      return removeLastDot0((price / 1000).toStringAsFixed(1)) + "K";
    }

    return removeLastDot0((price / 1000000).toStringAsFixed(1)) + "M";
  }

  static String formatPriceProductDisplay(double price) {
    final format = NumberFormat("##,###", 'vi-VN');

    return format.format(price);
  }

  static String removeLastDot0(String originalValue) {
    if (!originalValue.endsWith('.0')) return originalValue;

    return originalValue.split('.').first;
  }
}