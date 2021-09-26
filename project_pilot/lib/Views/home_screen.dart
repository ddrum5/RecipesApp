import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/ViewModels/recipes_viewmodel.dart';
import 'package:project_pilot/Helper/configs/app_color.dart';
import 'package:project_pilot/ViewModels/main_viewmodel.dart';
import 'package:project_pilot/Views/home/favorites_screen.dart';
import 'package:project_pilot/Views/home/joke_screen.dart';
import 'package:project_pilot/Views/home/recipes_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final MainViewModel mainViewModel;
  final FavoritesViewModel favoritesViewModel;

  HomeScreen(this.mainViewModel, this.favoritesViewModel);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenList = <Widget>[
      RecipesScreen(RecipesViewModel(), widget.favoritesViewModel),
      FavoritesScreen(widget.favoritesViewModel),
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
              selectedItemColor: AppColors.purplishBlue,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book, size: 25),
                    label: AppLocalizations.of(context)?.recipe),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star, size: 25),
                    label: AppLocalizations.of(context)?.favorite),
                BottomNavigationBarItem(
                    icon: Icon(Icons.insert_emoticon, size: 25),
                    label: AppLocalizations.of(context)?.joke)
              ],
            );
          },
        ));
  }
}
