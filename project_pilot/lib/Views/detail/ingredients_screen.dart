import 'package:flutter/material.dart';
import 'package:project_pilot/Views/widgets/data_empty_widget.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/Models/ingredient_model.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          if (snapshot.connectionState != ConnectionState.active) {
            return Center(
              child: Container(
                color: Colors.white,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (!snapshot.hasData) {
              return DataEmptyWidget(AppLocalizations.of(context)?.error ?? '');
            } else {
              return ListView.builder(
                itemCount:
                    widget._detailsViewModel.streamIngredients.value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.grayLite,
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
                            width: 113,
                            height: 111,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget._detailsViewModel.streamIngredients
                                      .value[index].imageUrl,
                                ),
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 111,
                          width: 1,
                          color: CustomColors.grayLite,
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
                                  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 25),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 16)),
                                Text(
                                  widget._detailsViewModel.streamIngredients
                                      .value[index].original,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.bodyText1,
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
            }
          }
        });
  }
}
