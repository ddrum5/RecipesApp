
import 'package:flutter/material.dart';
import 'package:project_pilot/constant/custom_theme.dart';
import 'package:project_pilot/view_models/home_viewmodel.dart';
import 'package:project_pilot/views/screens/home_screen_controller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightMode,
      home: HomeScreen(),
    );
  }
}
