import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/ViewModels/home/recipes_viewmodel.dart';
import 'package:project_pilot/views/screens/home/widgets/list_recipes_widget.dart';
import 'package:project_pilot/views/widgets/search_bar.dart';

class RecipesScreen extends StatefulWidget {

  RecipesViewModel recipesViewModel = RecipesViewModel.getInstance();
  String text = "";

  @override
  _RecipesScreen createState() => _RecipesScreen();
}

class _RecipesScreen extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.recipesViewModel.getRecipesData(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBar());
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.brightViolet,
        child: Image.asset('assets/images/icon_floating_action_button.png'),
        onPressed: () {},
      ),
      body: Center(
        child: StreamBuilder(
          stream: widget.recipesViewModel.streamData,
          builder: (context, snapshot) {
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
