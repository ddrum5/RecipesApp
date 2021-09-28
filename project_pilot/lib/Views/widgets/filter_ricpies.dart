import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/recipes_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_pilot/Helper/extentions/map_extension.dart';

class FilterRecipes extends StatefulWidget {
  final RecipesViewModel viewModel;

  FilterRecipes(this.viewModel);

  @override
  _FilterRecipesState createState() => _FilterRecipesState();
}

class _FilterRecipesState extends State<FilterRecipes> {

  Iterable<Widget> itemFilters(BuildContext context) sync* {

    final recipeTypesMap = {
      "All" : AppLocalizations.of(context)?.all ?? '',
      "Newest" : AppLocalizations.of(context)?.newest?? '',
      "Top rate" : AppLocalizations.of(context)?.top_rate?? '',
      "Most popular" : AppLocalizations.of(context)?.most_popular?? '',
      "Trendy" : AppLocalizations.of(context)?.trendy?? '',
      "Most Like" : AppLocalizations.of(context)?.most_like?? ''
    };

    for (var key in recipeTypesMap.keys) {
      var value = recipeTypesMap.getString(key);
      yield Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,0),
        child: FilterChip(
          label: Text(value),
          selected: widget.viewModel.recipeFilter.contains(key),
          labelStyle: widget.viewModel.recipeFilter.contains(key)
              ? Theme
              .of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: CustomColors.purplishBlue)
              : Theme
              .of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: CustomColors.graySpDark),
          checkmarkColor: CustomColors.purplishBlue,
          selectedColor: CustomColors.blueSuperLight,
          onSelected: (bool isSelected) {
            setState(() {
              widget.viewModel.recipeFilterState(key, isSelected);
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: 16),
      child: Wrap(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(Icons.filter_list),
                Padding(padding: EdgeInsets.all(3)),
                Text(
                  AppLocalizations
                      .of(context)
                      ?.filter ?? '',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 20),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Wrap(
              children: itemFilters(context).toList(),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: CustomColors.purplishBlue,
                  minimumSize: Size(double.infinity,
                      60)
              ),
              child: Text(AppLocalizations
                  .of(context)
                  ?.apply ?? ''),
              onPressed: () {
                widget.viewModel.getFilterRecipes();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ]),
    );
  }
}
