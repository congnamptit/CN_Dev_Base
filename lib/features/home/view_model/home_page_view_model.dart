import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/view_model/view_model.dart';
import '../stfuls/category_icon_item.dart';

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

  // Future<void> onClickMenuIcon() async {
  //   Navigator.of(context).push(PageRouteBuilder(
  //       pageBuilder: (_, __, ___) {},
  //       transitionDuration: const Duration(milliseconds: 750),
  //
  //       /// Set animation with opacity
  //       transitionsBuilder:
  //           (_, Animation<double> animation, __, Widget child) {
  //         return Opacity(
  //           opacity: animation.value,
  //           child: child,
  //         );
  //       }));
  // }

  List<CategoryIcon> listIcon = const [
    CategoryIcon(title: 'camera', icon: 'assets/icon/camera.png'),
    CategoryIcon(title: 'food', icon: 'assets/icon/food.png'),
    CategoryIcon(title: 'hand phone', icon: 'assets/icon/hand_phone.png'),
    CategoryIcon(title: 'gamming', icon: 'assets/icon/game.png'),
    CategoryIcon(title: 'fashion', icon: 'assets/icon/fashion.png'),
    CategoryIcon(title: 'health care', icon: 'assets/icon/health.png'),
    CategoryIcon(title: 'computer', icon: 'assets/icon/pc.png'),
    CategoryIcon(title: 'equipment', icon: 'assets/icon/mesin.png'),
    CategoryIcon(title: 'otomotif', icon: 'assets/icon/otomotif.png'),
    CategoryIcon(title: 'sport', icon: 'assets/icon/sport.png'),
    CategoryIcon(title: 'ticket cinema', icon: 'assets/icon/ticket.png'),
    CategoryIcon(title: 'book', icon: 'assets/icon/book.png'),
  ];
}
