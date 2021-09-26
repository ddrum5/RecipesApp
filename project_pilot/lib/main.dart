import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/Views/widgets/main_widget_inherited.dart';
import 'package:project_pilot/helper/custom_theme.dart';

import 'BusinessLayers/LocalDatabases/database.dart';
import 'ViewModels/main_viewmodel.dart';
import 'Views/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorFlutterDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  MainViewModel.favoriteRecipeDao = database.favoriteRecipeDao;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightMode,
      home: MainWidgetInherited(widget: HomeScreen(MainViewModel()), favoritesViewModel: FavoritesViewModel()),
    );
  }
}
