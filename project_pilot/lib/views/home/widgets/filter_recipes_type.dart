import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/home/recipes_viewmodel.dart';
import 'package:project_pilot/helper/custom_color.dart';

class FilterRecipesType extends StatefulWidget {
  final RecipesViewModel viewModel;

  FilterRecipesType(this.viewModel);

  @override
  _FilterRecipesTypeState createState() => _FilterRecipesTypeState();
}

class _FilterRecipesTypeState extends State<FilterRecipesType> {
  Iterable<Widget> get itemMeals sync* {
    for (var element in widget.viewModel.mealTypes) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(element),
          selected: identical(widget.viewModel.mealFilter, element),
          labelStyle: identical(widget.viewModel.mealFilter, element)
              ? TextStyle(color: CustomColor.blueLight)
              : TextStyle(color: CustomColor.grayDark),
          checkmarkColor: CustomColor.blueLight,
          selectedColor: CustomColor.blueSuperLight,
          onSelected: (bool value) {
            setState(() {
              widget.viewModel.mealFilterState(element, value);
            });
          },
        ),
      );
    }
  }

  Iterable<Widget> get itemDiets sync* {
    for (var element in widget.viewModel.dietTypes) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(element),
          selected: identical(widget.viewModel.dietFilter, element),
          labelStyle: identical(widget.viewModel.dietFilter, element)
              ? TextStyle(color: CustomColor.blueLight)
              : TextStyle(color: CustomColor.grayDark),
          checkmarkColor: CustomColor.blueLight,
          selectedColor: CustomColor.blueSuperLight,
          onSelected: (bool value) {
            setState(() {
              widget.viewModel.dietFilterState(element, value);
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
        padding: EdgeInsets.symmetric(vertical: 27, horizontal: 16),
        child: Wrap(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Meal type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Padding(padding: EdgeInsets.all(5)),
              Wrap(
                children: itemMeals.toList(),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'Diet type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Wrap(
                children: itemDiets.toList(),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: CustomColor.purplishBlue,
                    minimumSize: Size(double.infinity,
                        60) // double.infinity is the width and 30 is the height
                    ),
                child: Text('APPLY'),
                onPressed: () {
                  setState(() {
                    widget.viewModel.getFilterRecipes(
                        dietType: widget.viewModel.dietFilter,
                        mealType: widget.viewModel.mealFilter);
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
