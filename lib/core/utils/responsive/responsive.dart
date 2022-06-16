part of utils;

enum DeviceType { mobile, tablet }

extension ResponsiveUtilExtension on num {
  /// Nhận chiều cao theo tỉ lệ % màn hình
  /// Eg: 10.h -> will take 10% of the screen's height
  double get h => this * Responsive.height / 100;

  /// Nhận chiều rộng theo tỉ lệ % màn hình
  /// Eg: 10.h -> will take 10% of the screen's height
  double get w => this * Responsive.width / 100;

  /// Tính toán sp (Scalable Pixel) tùy thuộc vào màn hình của thiết bị
  double get sp => this * (Responsive.width / 3) / 100;
}

class Responsive {
  Responsive._();

  static Responsive? _instance;

  factory Responsive() => _instance ??= Responsive._();

  /// Device BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device Orientation (chế độ dọc-ngang)
  static late Orientation orientation;

  /// Device Type
  static late DeviceType deviceType;

  /// Device height
  static late double height;

  /// Device width
  static late double width;

  /// Đặt kích thước cho mobile và tablet
  /// BoxConstraints, Height, Width
  static void setResponsive(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    // Set boxConstraints, orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Set screen width, height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Set screen Type
    if (orientation == Orientation.portrait && width < 600 ||
        (orientation == Orientation.landscape && height < 600)) {
      deviceType = DeviceType.mobile;
    } else {
      deviceType == DeviceType.tablet;
    }
  }

  /// Trả về [true] khi chạy trên mobile
  /// Trả về [false] khi chạy trên tablet
  static bool get isMobile => deviceType == DeviceType.mobile;

  /// Trả về [true] khi chạy trên tablet
  /// Trả về [false] khi chạy trên mobile
  static bool get isTablet => deviceType == DeviceType.tablet;
}
