import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';
import 'package:project_pilot/Views/widgets/snack_bar.dart';
import 'package:project_pilot/Models/recipe_model.dart';
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
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
            child: Text(
              AppLocalizations.of(context)?.overview ?? '',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        Container(
            padding: EdgeInsets.only(bottom: 14),
            child: Text(
              AppLocalizations.of(context)?.ingredient ?? '',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        Container(
            padding: EdgeInsets.only(bottom: 14),
            child: Text(
              AppLocalizations.of(context)?.instructions ?? '',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
      ],
      indicatorColor: Colors.white,
    );

buildIconAdd(BuildContext context, Function f) {
  return IconButton(
    onPressed: () {
      f();
      BuildSnackBar.showSnackBar(
          context, AppLocalizations.of(context)?.msgSaveRecipe ?? '');
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
      BuildSnackBar.showSnackBar(
          context, AppLocalizations.of(context)?.msgRemoveRecipes ?? '');
    },
    icon: Icon(
      Icons.star,
      color: Colors.yellow,
    ),
  );
}
