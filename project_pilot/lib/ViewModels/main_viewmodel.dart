import 'package:project_pilot/BusinessLayers/LocalDatabases/favorite_recipe_dao.dart';
import 'package:rxdart/rxdart.dart';

class MainViewModel {
  BehaviorSubject<int> currentScreenIndex = BehaviorSubject<int>();

  MainViewModel() {
    currentScreenIndex.sink.add(0);
  }

  void onItemTapped(int index) {
    currentScreenIndex.sink.add(index);
  }

  void dispose() {
    currentScreenIndex.close();
  }

}
