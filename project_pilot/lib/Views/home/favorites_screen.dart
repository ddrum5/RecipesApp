import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/Views/widgets/list_favorite_recipes.dart';
import 'package:project_pilot/Views/widgets/snack_bar.dart';
import 'package:project_pilot/views/widgets/data_empty_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesScreen extends StatefulWidget {
  final FavoritesViewModel favoritesViewModel;

  FavoritesScreen(this.favoritesViewModel);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    widget.favoritesViewModel.getListRecipesFromLocal();
    widget.favoritesViewModel.unselectAll();
    widget.favoritesViewModel.streamListFilter.listen((value) {
      print("======================= ${value.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.favoritesViewModel.streamListFilter,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              appBar: widget.favoritesViewModel.streamListFilter.value.isEmpty
                  ? AppBar(
                      title: Text(
                        AppLocalizations.of(context)?.favoriteTitle ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      actions: [
                        PopupMenuButton<int>(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem<int>(
                                value: 0,
                                child: Text(AppLocalizations.of(context)
                                        ?.removeAllRecipes ??
                                    '')),
                          ],
                          onSelected: (index) {
                            showAlertDialog(context, () {
                              widget.favoritesViewModel
                                  .deleteAllFavoriteRecipes();
                              BuildSnackBar.showSnackBar(
                                  context,
                                  AppLocalizations.of(context)
                                          ?.msgRemoveRecipes ??
                                      '');
                            });
                          },
                        ),
                      ],
                    )
                  : AppBar(
                      backgroundColor: Colors.black,
                      title: Align(
                        child: Text(
                          '${widget.favoritesViewModel.streamListFilter.value.length} '
                          '${AppLocalizations.of(context)?.recipeSelected}',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      leading: IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white),
                        onPressed: () {
                          widget.favoritesViewModel.unselectAll();
                        },
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            widget.favoritesViewModel.deleteSelectedItem();
                            BuildSnackBar.showSnackBar(
                                context,
                                AppLocalizations.of(context)
                                        ?.msgRemoveRecipes ??
                                    '');
                          },
                        ),
                      ],
                    ),
              body: Center(
                child: StreamBuilder(
                  stream: widget.favoritesViewModel.streamData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (widget
                          .favoritesViewModel.streamData.value.isNotEmpty) {
                        return ListFavoriteRecipes(widget.favoritesViewModel);
                      } else {
                        return DataEmptyWidget(
                            AppLocalizations.of(context)?.no_favorites ?? '');
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            );
          }
        });
  }
}

showAlertDialog(BuildContext context, Function f) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(AppLocalizations.of(context)?.cancel ?? '',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: CustomColors.purplishBlue, fontWeight: FontWeight.bold)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget yesButton = TextButton(
    child: Text(AppLocalizations.of(context)?.yes ?? '',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: CustomColors.purplishBlue, fontWeight: FontWeight.bold)),
    onPressed: () {
      f();
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text(AppLocalizations.of(context)?.delete_all ?? '',
        style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 22)),
    content: Text(AppLocalizations.of(context)?.confirmRemoveAllRecipe ?? '',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16)),
    actions: [
      cancelButton,
      yesButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
