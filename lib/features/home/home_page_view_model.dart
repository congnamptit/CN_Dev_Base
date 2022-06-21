import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/view_model/view_model.dart';

final homeVMProvider = ChangeNotifierProvider<HomeViewModel>(
      (ref) => HomeViewModel(ref.read),
);

class HomeViewModel extends ViewModel {
  HomeViewModel(Reader read)
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
