
import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_theme.dart';
import 'package:project_pilot/views/home_screen.dart';


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
