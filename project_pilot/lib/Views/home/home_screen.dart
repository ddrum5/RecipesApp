import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/ViewModels/main_viewmodel.dart';
import 'package:project_pilot/views/home/favorites_screen.dart';
import 'package:project_pilot/views/home/joke_screen.dart';
import 'package:project_pilot/views/home/recipes_screen.dart';

class HomeScreen extends StatefulWidget {

  final MainViewModel mainViewModel;

  HomeScreen(this.mainViewModel);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  
  final List<Widget> _screenList = <Widget>[
    RecipesScreen(),
    FavoritesScreen(FavoritesViewModel()),
    JokeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<int>(
          stream: widget.mainViewModel.currentScreenIndex,
          builder: (context, snapshot) {
            return Center(
              child: _screenList
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
