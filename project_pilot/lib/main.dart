import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'BusinessLayers/LocalDatabases/database.dart';
import 'Helper/configs/app_theme.dart';
import 'ViewModels/base_viewmodel.dart';
import 'ViewModels/main_viewmodel.dart';
import 'Views/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorFlutterDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  BaseViewModel.favoriteRecipeDao = database.favoriteRecipeDao;
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
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('vi', ''),
      ],
      theme: AppTheme.lightMode,
      home: HomeScreen(MainViewModel(), FavoritesViewModel()),
    );
  }
}
