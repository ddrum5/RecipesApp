import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/ViewModels/recipes_viewmodel.dart';
import 'package:project_pilot/views/widgets/filter_recipes_type.dart';
import 'package:project_pilot/views/widgets/filter_ricpies.dart';
import 'package:project_pilot/views/widgets/list_recipes_widget.dart';
import 'package:project_pilot/views/widgets/data_empty_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecipesScreen extends StatefulWidget {
  final RecipesViewModel recipesViewModel;
  final FavoritesViewModel favoritesViewModel;

  RecipesScreen(this.recipesViewModel, this.favoritesViewModel);

  @override
  _RecipesScreen createState() => _RecipesScreen();
}

class _RecipesScreen extends State<RecipesScreen> {
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
              title: !widget.recipesViewModel.isSearching.value
                  ? Text(AppLocalizations.of(context)?.recipe ?? '')
                  : TextField(
                      onSubmitted: (text) {
                        widget.recipesViewModel.getSearchRecipes(text: text);
                        widget.recipesViewModel.changeSearchState();
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)?.search ?? '',
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
              backgroundColor: CustomColors.brightViolet,
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
            body: Container(
              child: StreamBuilder(
                stream: widget.recipesViewModel.streamData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (widget.recipesViewModel.streamData.value.isNotEmpty) {
                      return ListRecipesWidget(
                          widget.recipesViewModel.streamData,
                          widget.favoritesViewModel);
                    } else {
                      return DataEmptyWidget(AppLocalizations.of(context)?.no_recipes??'');
                    }
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
