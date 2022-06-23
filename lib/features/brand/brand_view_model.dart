import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/view_model/view_model.dart';

final brandVMProvider = ChangeNotifierProvider<BrandViewModel>(
  (ref) => BrandViewModel(ref.read),
);

class BrandViewModel extends ViewModel {
  BrandViewModel(Reader read)
      : _read = read,
        super(read);

  final Reader _read;
}
