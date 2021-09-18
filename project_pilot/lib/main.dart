
import 'package:flutter/material.dart';
import 'package:product/constant/custom_theme.dart';
import 'package:product/view_models/home_viewmodel.dart';
import 'package:product/views/screens/home_screen.dart';


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
      home: HomeScreen(HomeViewModel()),
    );
  }
}
