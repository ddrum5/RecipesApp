import 'package:flutter/cupertino.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';

class MainWidgetInherited extends InheritedWidget {
  final FavoritesViewModel favoritesViewModel;

  MainWidgetInherited({required Widget widget, required this.favoritesViewModel}) : super(child: widget);

  @override
  bool updateShouldNotify(covariant MainWidgetInherited oldWidget) {
    return favoritesViewModel != oldWidget.favoritesViewModel;
  }

  static MainWidgetInherited? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MainWidgetInherited>();
  }
}
