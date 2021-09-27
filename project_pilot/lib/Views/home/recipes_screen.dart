import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/ViewModels/recipes_viewmodel.dart';
import 'package:project_pilot/Views/widgets/list_recipes_widget.dart';
import 'package:project_pilot/Views/widgets/filter_recipes_type.dart';
import 'package:project_pilot/views/widgets/filter_ricpies.dart';
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
    final myAction = Row(
      children: [
        GestureDetector(
          child: const Icon(Icons.search),
          onTap: () {
            widget.recipesViewModel.changeSearchState();
          },
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FilterRecipes(widget.recipesViewModel);
                });
          },
          child: const Icon(Icons.filter_list_outlined),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
    final searchField = Container(
      width: double.maxFinite,
      color: Colors.white,
      child: TextField(

        onSubmitted: (text) {
          widget.recipesViewModel.getSearchRecipes(text);
          widget.recipesViewModel.changeSearchState();
        },
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              widget.recipesViewModel.changeSearchState();
            },
            color: const Color(0x61000000),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.keyboard_voice),
            onPressed: () {},
            color: const Color(0x61000000),
          ),
          hintText: AppLocalizations.of(context)?.search ?? '',
        ),
      ),
    );

    return StreamBuilder<bool>(
        stream: widget.recipesViewModel.isSearching,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: widget.recipesViewModel.isSearching.value
                  ? searchField
                  : Text(
                      AppLocalizations.of(context)?.recipe ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white, fontSize: 20),
                    ),
              actions: <Widget>[
                widget.recipesViewModel.isSearching.value
                    ? Container()
                    : myAction,
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
                      return DataEmptyWidget(
                          AppLocalizations.of(context)?.no_recipes ?? '');
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
