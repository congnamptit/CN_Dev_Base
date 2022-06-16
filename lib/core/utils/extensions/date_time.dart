import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format(DateFormat format) {
    return format.format(this);
  }

  String formatYYYYMMdd() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatddMMYYYY() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}
