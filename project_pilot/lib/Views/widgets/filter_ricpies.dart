import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/recipes_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FilterRecipes extends StatefulWidget {
  final RecipesViewModel viewModel;

  FilterRecipes(this.viewModel);

  @override
  _FilterRecipesState createState() => _FilterRecipesState();
}

class _FilterRecipesState extends State<FilterRecipes> {
  Iterable<Widget> get itemFilters sync* {
    for (var element in widget.viewModel.recipeTypes) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(element),
          selected: widget.viewModel.recipeFilter.contains(element),
          labelStyle: widget.viewModel.recipeFilter.contains(element)
              ? Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: CustomColors.purplishBlue)
              : Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: CustomColors.graySpDark),
          checkmarkColor: CustomColors.purplishBlue,
          selectedColor: CustomColors.blueSuperLight,
          onSelected: (bool value) {
            setState(() {
              widget.viewModel.recipeFilterState(element, value);
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
                  AppLocalizations.of(context)?.filter??'',
                  style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 20),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Wrap(
              children: itemFilters.toList(),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: CustomColors.purplishBlue,
                  minimumSize: Size(double.infinity,
                      60) // double.infinity is the width and 30 is the height
                  ),
              child: Text(AppLocalizations.of(context)?.apply??''),
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
