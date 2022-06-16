extension BoolExtension on bool {

  int toInt() {
    if (this) return 1;

    return 0;
  }
}
