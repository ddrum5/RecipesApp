import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/recipes_viewmodel.dart';
import 'package:project_pilot/Helper/configs/app_color.dart';
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
              ? TextStyle(color: AppColors.blueLight)
              : TextStyle(color: AppColors.grayDark),
          checkmarkColor: AppColors.blueLight,
          selectedColor: AppColors.blueSuperLight,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                primary: AppColors.purplishBlue,
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
