import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/view_models/home/recipes_viewmodel.dart';
import 'package:project_pilot/views/screens/home/widgets/list_recipes_widget.dart';

class RecipesScreen extends StatefulWidget {

  RecipesViewModel recipesViewModel = RecipesViewModel.getInstance();

  @override
  _RecipesScreen createState() => _RecipesScreen();
}

class _RecipesScreen extends State<RecipesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.recipesViewModel.getRandomRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.brightViolet,
        child: Image.asset('assets/images/icon_floating_action_button.png'),
        onPressed: () {},
      ),
      body: Center(
        child: StreamBuilder(
          stream: widget.recipesViewModel.streamData,
          builder: (context, AsyncSnapshot<Object?> snapshot) {
            if (snapshot.hasData) {
              return ListRecipesWidget(widget.recipesViewModel);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
