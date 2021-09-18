import 'package:flutter/material.dart';
import 'package:product/constant/custom_color.dart';
import 'package:product/view_models/home_viewmodel.dart';
import 'package:product/views/screens/home_screens/favorites_screen.dart';
import 'package:product/views/screens/home_screens/joke_screen.dart';
import 'package:product/views/screens/home_screens/recipes_screen.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel homeViewModel;

  HomeScreen(this.homeViewModel);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<Widget> _screenList = <Widget>[
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
