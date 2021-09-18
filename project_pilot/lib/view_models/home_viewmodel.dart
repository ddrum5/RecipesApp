
import 'package:rxdart/rxdart.dart';

class HomeViewModel{
  BehaviorSubject<int> currentScreenIndex=BehaviorSubject<int>();

  HomeViewModel(){
    currentScreenIndex.sink.add(0);
  }
  void onItemTapped(int index){
    currentScreenIndex.sink.add(index);
  }

void dispose(){
    currentScreenIndex.close();
}
}


