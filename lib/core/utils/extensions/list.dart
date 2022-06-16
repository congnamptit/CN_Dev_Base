part of utils;

///
/// 「list」Defines a type extensions function.
///

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.forEach but callback have index as second argument
  void forEachIndexed(void Function(E e, int i) f) {
    int i = 0;
    forEach((e) => f(e, i++));
  }

  /// Like Iterable<T>.map<T> but callback have index as second argument
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    int i = 0;
    return map<T>((e) => f(e, i++));
  }
}
