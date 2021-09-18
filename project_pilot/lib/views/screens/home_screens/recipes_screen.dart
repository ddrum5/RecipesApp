import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product/constant/custom_color.dart';

class RecipesScreen extends StatefulWidget {
  RecipesScreen();

  @override
  _RecipesScreen createState() => _RecipesScreen();
}

class _RecipesScreen extends State<RecipesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   widgets.recipesBottomBarViewModel.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.brightViolet,
        child:
        Image.asset('assets/images/icon_floating_action_button.png'),
        onPressed: () {},
      ),
      body: Center(),
    );
  }
}
