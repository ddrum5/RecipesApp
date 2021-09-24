import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/models/ingredient_model.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';

class IngredientsScreen extends StatefulWidget {
  final DetailsViewModel _detailsViewModel;

  IngredientsScreen(this._detailsViewModel);

  @override
  _IngredientsScreenState createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<IngredientModel>>(
        stream: widget._detailsViewModel.streamIngredients,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: widget._detailsViewModel.streamIngredients.value.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColor.grayLite,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            image: DecorationImage(
                              image: NetworkImage(widget._detailsViewModel
                                  .streamIngredients.value[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    Container(
                      height: 111,
                      width: 1,
                      color: CustomColor.grayLite,
                    ),

                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget._detailsViewModel.streamIngredients
                                  .value[index].name,
                              maxLines: 1,
                              style: TextStyle(fontSize: 25),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 16)),
                            Text(
                              widget._detailsViewModel.streamIngredients
                                  .value[index].original,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14, color: CustomColor.grayDark),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
