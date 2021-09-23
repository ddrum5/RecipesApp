
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  static HomeViewModel? _homeViewModel;

  static HomeViewModel getInstance() {
    if (_homeViewModel == null) {
      _homeViewModel = HomeViewModel();
    }
    return _homeViewModel!;
  }

  BehaviorSubject<int> currentScreenIndex = BehaviorSubject<int>();

  HomeViewModel() {
    currentScreenIndex.sink.add(0);
  }

  void onItemTapped(int index) {
    currentScreenIndex.sink.add(index);
  }

  void dispose() {
    currentScreenIndex.close();
  }


}
