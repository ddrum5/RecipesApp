import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen();

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();

}
class _FavoritesScreenState extends State<FavoritesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Recipes"),
      ),
      body: Center(
            child: Image.asset("assets/images/favorite_data_empty.png"),
          ),
    );
  }

}