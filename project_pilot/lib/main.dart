import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/base_viewmodel.dart';
import 'package:project_pilot/helper/custom_theme.dart';
import 'package:project_pilot/views/home/home_screen.dart';

import 'ViewModels/main_viewmodel.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseViewModel.initRecipeDao();
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
      home: HomeScreen(MainViewModel()),
    );
  }
}
