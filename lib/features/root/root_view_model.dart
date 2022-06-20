import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/view_model/view_model.dart';

final rootVMProvider = ChangeNotifierProvider<RootViewModel>(
  (ref) => RootViewModel(ref.read),
);

class RootViewModel extends ViewModel {
  RootViewModel(Reader read)
      : _read = read,
        super(read);

  final Reader _read;

  int _totalOrder = 0;

  int get totalOrder => _totalOrder;

  set totalOrder(int newOrder) {
    _totalOrder = newOrder;

    updateState();
  }
}
