import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/recipes_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_pilot/Helper/extentions/map_extension.dart';

class FilterRecipesType extends StatefulWidget {
  final RecipesViewModel viewModel;

  FilterRecipesType(this.viewModel);

  @override
  _FilterRecipesTypeState createState() => _FilterRecipesTypeState();
}

class _FilterRecipesTypeState extends State<FilterRecipesType> {


  Iterable<Widget> itemMeals(BuildContext context) sync* {
    final mealTypes = {
      "Main Course" : AppLocalizations.of(context)?.main_course ?? '',
      "Snack" : AppLocalizations.of(context)?.snack?? '',
      "Dessert": AppLocalizations.of(context)?.dessert ?? '',
      "Appetizer": AppLocalizations.of(context)?.appetizer ?? '',
      "Drink": AppLocalizations.of(context)?.drink ?? '',
      "Salad": AppLocalizations.of(context)?.salad ?? '',
      "Finger Food" : AppLocalizations.of(context)?.finger_food ?? ''
    };

    for (var key in mealTypes.keys) {
      var value = mealTypes.getString(key);
      yield Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
        child: FilterChip(
          label: Text(value),
          backgroundColor: Colors.black.withOpacity(0.05),
          selected: identical(widget.viewModel.mealFilter, key),
          labelStyle: identical(widget.viewModel.mealFilter, key)
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
              widget.viewModel.mealFilterState(key, value);
            });
          },
        ),
      );
    }
  }

  Iterable<Widget> itemDiets(BuildContext context) sync* {

    final dietTypes = {
      "Vegan" : AppLocalizations.of(context)?.vegan ?? '',
      "Vegetarian" : AppLocalizations.of(context)?.vegetarian ?? '',
      "Ketogenic": AppLocalizations.of(context)?.ketogenic ?? '',
      "Dairy Free": AppLocalizations.of(context)?.dairy_free ?? '',
      "Gluten Free": AppLocalizations.of(context)?.gluten_free ?? '',
      "Paleo": AppLocalizations.of(context)?.paleo ?? '',
      "Lacto-Vegetarian": AppLocalizations.of(context)?.lacto_vegetarian ?? ''
    };

    for (var key in dietTypes.keys) {
      var value = dietTypes.getString(key);
      yield Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
        child: FilterChip(
          label: Text(value),
          backgroundColor: Colors.black.withOpacity(0.05),
          selected: identical(widget.viewModel.dietFilter, key),
          labelStyle: identical(widget.viewModel.dietFilter, key)
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
              widget.viewModel.dietFilterState(key, value);
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 27, horizontal: 16),
        child: Wrap(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)?.meal ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: itemMeals(context).toList(),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                AppLocalizations.of(context)?.diet ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: itemDiets(context).toList(),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: CustomColors.purplishBlue,
                    minimumSize: Size(double.infinity,
                        60) // double.infinity is the width and 30 is the height
                    ),
                child: Text(AppLocalizations.of(context)?.apply ?? ''),
                onPressed: () {
                  setState(() {
                    widget.viewModel.getFilterRecipesByTypes();
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
