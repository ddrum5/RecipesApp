import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/home/recipes_viewmodel.dart';
import 'package:project_pilot/helper/custom_color.dart';

class FilterRecipes extends StatefulWidget {
  final RecipesViewModel viewModel;

  FilterRecipes(this.viewModel);
  @override
  _FilterRecipesState createState() => _FilterRecipesState();
}

class _FilterRecipesState extends State<FilterRecipes> {

  Iterable<Widget> get itemFilters sync* {
    for (var i = 0; i < widget.viewModel.recipeTypes.length; i++) {
      var element = widget.viewModel.recipeTypes.elementAt(i);
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(element.title),
          selected: widget.viewModel.recipeFilters.contains(element),
          labelStyle: element.isSelected
              ? TextStyle(color: CustomColor.blueLight)
              : TextStyle(color: CustomColor.grayDark),
          checkmarkColor: CustomColor.blueLight,
          selectedColor: CustomColor.blueSuperLight,
          onSelected: (bool value) {
            setState(() {
              widget.viewModel.dietFilterState(element.title, value);
              widget.viewModel.recipeTypes.elementAt(i).isSelected = value;
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
            Text(
              'Filter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Wrap(
              children: itemFilters.toList(),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,
                      60) // double.infinity is the width and 30 is the height
              ),
              child: Text('APPLY'),
              onPressed: () {},
            )
          ],
        ),
      ]),
    );
  }
}
