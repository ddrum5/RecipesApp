import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/home/recipes_viewmodel.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/models/item_filter_model.dart';

class FilterRecipesType extends StatefulWidget {
  final RecipesViewModel viewModel;

  FilterRecipesType(this.viewModel);

  @override
  _FilterRecipesTypeState createState() => _FilterRecipesTypeState();
}

class _FilterRecipesTypeState extends State<FilterRecipesType> {

  Iterable<Widget> get itemMeals sync* {
    for (var i = 0; i < widget.viewModel.mealTypes.length; i++) {
      var element = widget.viewModel.mealTypes.elementAt(i);
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(element.title),
          selected: widget.viewModel.mealFilters.contains(element.title),
          labelStyle: element.isSelected
              ? TextStyle(color: CustomColor.blueLight)
              : TextStyle(color: CustomColor.grayDark),
          checkmarkColor: CustomColor.blueLight,
          selectedColor: CustomColor.blueSuperLight,
          onSelected: (bool value) {
            setState(() {
              widget.viewModel.mealFilterState(element.title, value);
              widget.viewModel.mealTypes.elementAt(i).isSelected = value;
            });
          },
        ),
      );
    }
  }

  Iterable<Widget> get itemDiets sync* {
    for (var i = 0; i < widget.viewModel.dietTypes.length; i++) {
      var element = widget.viewModel.dietTypes.elementAt(i);
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(element.title),
          selected: widget.viewModel.dietFilters.contains(element),
          labelStyle: element.isSelected
              ? TextStyle(color: CustomColor.blueLight)
              : TextStyle(color: CustomColor.grayDark),
          checkmarkColor: CustomColor.blueLight,
          selectedColor: CustomColor.blueSuperLight,
          onSelected: (bool value) {
            setState(() {
              widget.viewModel.dietFilterState(element.title, value);
              widget.viewModel.dietTypes.elementAt(i).isSelected = value;
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
