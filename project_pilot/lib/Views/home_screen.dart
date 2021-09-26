import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/Views/widgets/main_widget_inherited.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/ViewModels/main_viewmodel.dart';
import 'package:project_pilot/Views/home/favorites_screen.dart';
import 'package:project_pilot/Views/home/joke_screen.dart';
import 'package:project_pilot/Views/home/recipes_screen.dart';

class HomeScreen extends StatefulWidget {
  final MainViewModel mainViewModel;

  HomeScreen(this.mainViewModel);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final homeScreenList = <Widget>[
      RecipesScreen(),
      FavoritesScreen(MainWidgetInherited.of(context)!.favoritesViewModel),
      JokeScreen()
    ];

    return Scaffold(
        body: StreamBuilder<int>(
          stream: widget.mainViewModel.currentScreenIndex,
          builder: (context, snapshot) {
            return Center(
              child: homeScreenList
                  .elementAt(widget.mainViewModel.currentScreenIndex.value),
            );
          },
        ),
        bottomNavigationBar: StreamBuilder<int>(
          stream: widget.mainViewModel.currentScreenIndex,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: widget.mainViewModel.currentScreenIndex.value,
              onTap: widget.mainViewModel.onItemTapped,
              selectedItemColor: CustomColor.purplishBlue,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book, size: 25), label: "Recipes"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star, size: 25), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.insert_emoticon, size: 25), label: "Joke")
              ],
            );
          },
        ));
  }
}
