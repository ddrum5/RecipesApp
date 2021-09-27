import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/views/detail/ingredients_screen.dart';
import 'package:project_pilot/views/detail/instructions_screen.dart';
import 'package:project_pilot/views/detail/overview_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailScreen extends StatefulWidget {
  final RecipeModel recipeModel;
  final DetailsViewModel detailsViewModel;

  DetailScreen(this.recipeModel, this.detailsViewModel);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    widget.detailsViewModel.getDetailRecipeData(widget.recipeModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.detailsViewModel.streamIsRecipeExist,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(color: Colors.white);
          } else {
            return DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(
                      AppLocalizations.of(context)?.details ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    actions: [
                      widget.detailsViewModel.streamIsRecipeExist.value
                          ? buildIconRemove(
                              context,
                              () => widget.detailsViewModel
                                  .deleteRecipeFromFavorite(widget.recipeModel),
                            )
                          : buildIconAdd(
                              context,
                              () => widget.detailsViewModel
                                  .insertRecipesToFavorite(widget.recipeModel),
                            )
                    ],
                    bottom: tabBar(context),
                  ),
                  body: TabBarView(
                    children: [
                      OverviewScreen(widget.detailsViewModel),
                      IngredientsScreen(widget.detailsViewModel),
                      InstructionsScreen(widget.detailsViewModel),
                    ],
                  ),
                ));
          }
        });
  }
}

TabBar tabBar(BuildContext context) => TabBar(
      tabs: [
        Container(
          padding: EdgeInsets.only(bottom: 14),
          child: Text(AppLocalizations.of(context)?.overview ?? '',
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
        Container(
            padding: EdgeInsets.only(bottom: 14),
            child: Text(
              AppLocalizations.of(context)?.ingredient ?? '',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
        Container(
            padding: EdgeInsets.only(bottom: 14),
            child: Text(
              AppLocalizations.of(context)?.instructions ?? '',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
      ],
      indicatorColor: Colors.white,
    );

buildIconAdd(BuildContext context, Function f) {
  return IconButton(
    onPressed: () {
      f();
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      final snackBar = buildSnackBar(
          context, AppLocalizations.of(context)?.msgSaveRecipe ?? '');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    icon: Icon(
      Icons.star,
      color: Colors.white,
    ),
  );
}

buildIconRemove(BuildContext context, Function f) {
  return IconButton(
    onPressed: () {
      f();
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      final snackBar = buildSnackBar(
          context, AppLocalizations.of(context)?.msgRemoveRecipes ?? '');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    icon: Icon(
      Icons.star,
      color: Colors.yellow,
    ),
  );
}

SnackBar buildSnackBar(BuildContext context, String text) {
  return SnackBar(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    content: Text(text),
    action: SnackBarAction(
      textColor: CustomColors.brightVioletLight,
      label: AppLocalizations.of(context)?.ok ?? '',
      onPressed: () {},
    ),
  );
}
