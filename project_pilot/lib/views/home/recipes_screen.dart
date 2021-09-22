import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/ViewModels/home/recipes_viewmodel.dart';
import 'package:project_pilot/views/home/widgets/filter_recipes_type.dart';
import 'package:project_pilot/views/home/widgets/filter_ricpies.dart';
import 'package:project_pilot/views/home/widgets/list_recipes_widget.dart';

class RecipesScreen extends StatefulWidget {
  final RecipesViewModel recipesViewModel = RecipesViewModel.getInstance();

  @override
  _RecipesScreen createState() => _RecipesScreen();
}

class _RecipesScreen extends State<RecipesScreen> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    widget.recipesViewModel.getRandomRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.recipesViewModel.isSearching,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: CustomColor.purplishBlue,
              title: !widget.recipesViewModel.isSearching.value
                  ? Text('Recipes')
                  : TextField(
                      onSubmitted: (text) {
                        widget.recipesViewModel.getRecipesByText(text: text);
                        widget.recipesViewModel.changeSearchState();
                      },
                      decoration: InputDecoration(
                        hintText: "Input text here",
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                    ),
              actions: <Widget>[
                widget.recipesViewModel.isSearching.value
                    ? IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          widget.recipesViewModel.changeSearchState();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          widget.recipesViewModel.changeSearchState();
                        },
                      ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return FilterRecipes(widget.recipesViewModel);
                        });
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: CustomColor.brightViolet,
              child:
                  Image.asset('assets/images/icon_floating_action_button.png'),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return FilterRecipesType(widget.recipesViewModel);
                  },
                );
              },
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
        });
  }
}
