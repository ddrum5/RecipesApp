import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/view_models/home_viewmodel.dart';
import 'package:project_pilot/views/screens/home/favorites_screen.dart';
import 'package:project_pilot/views/screens/home/joke_screen.dart';
import 'package:project_pilot/views/screens/home/recipes_screen.dart';

class HomeScreen extends StatefulWidget {

  final homeViewModel = HomeViewModel.getInstance();

  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final List<Widget> _screenList = <Widget>[
    RecipesScreen(),
    FavoritesScreen(),
    JokeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<int>(
          stream: widget.homeViewModel.currentScreenIndex,
          builder: (context, snapshot) {
            return Center(
              child: _screenList
                  .elementAt(widget.homeViewModel.currentScreenIndex.value),
            );
          },
        ),
        bottomNavigationBar: StreamBuilder<int>(
          stream: widget.homeViewModel.currentScreenIndex,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: widget.homeViewModel.currentScreenIndex.value,
              onTap: widget.homeViewModel.onItemTapped,
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
