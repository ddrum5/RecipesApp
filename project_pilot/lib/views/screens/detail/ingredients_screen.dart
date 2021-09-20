import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/models/ingredient_model.dart';
import 'package:project_pilot/view_models/detail/details_viewmodel.dart';

class IngredientsScreen extends StatefulWidget {
  DetailsViewModel _detailsViewModel;

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
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(width: 1, color: CustomColor.grayLite)),
                elevation: 10,
                margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          height: 123,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              image: DecorationImage(
                                image: NetworkImage(widget
                                        ._detailsViewModel
                                        .streamIngredients
                                        .value[index]
                                        .imageUrl ??
                                    ""),
                                fit: BoxFit.cover,
                              ))),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(
                                  widget._detailsViewModel.streamIngredients
                                          .value[index].name ??
                                      "",
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 25),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 16)),
                                Text(
                                  widget._detailsViewModel.streamIngredients
                                          .value[index].original ??
                                      "",
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomColor.grayDark),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              );
            },
          );
        });
  }
}
