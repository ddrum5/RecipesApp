import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/views/widgets/list_recipes_widget.dart';
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
    // TODO: implement initState
    super.initState();
    widget.favoritesViewModel.getListRecipesFromLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.favoriteTitle ?? ''),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                      AppLocalizations.of(context)?.removeAllRecipes ?? '')),
            ],
            onSelected: (index) {
              showAlertDialog(context, () {
                widget.favoritesViewModel.deleteAllFavoriteRecipes();
              });
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: widget.favoritesViewModel.streamData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (widget.favoritesViewModel.streamData.value.isNotEmpty) {
                return ListRecipesWidget(widget.favoritesViewModel.streamData,
                    widget.favoritesViewModel);
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
}

showAlertDialog(BuildContext context, Function f) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(AppLocalizations.of(context)?.cancel ?? ''),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget yesButton = TextButton(
    child: Text(AppLocalizations.of(context)?.yes ?? ''),
    onPressed: () {
      f();
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(AppLocalizations.of(context)?.confirmRemoveAllRecipe ?? ''),
    actions: [
      yesButton,
      cancelButton,
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
