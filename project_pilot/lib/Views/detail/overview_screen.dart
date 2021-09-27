import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/views/widgets/data_empty_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_pilot/Helper/extentions/string_extension.dart';

class OverviewScreen extends StatefulWidget {
  final DetailsViewModel _detailsViewModel;

  OverviewScreen(this._detailsViewModel);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: widget._detailsViewModel.streamOverView,
        builder: (context, AsyncSnapshot<Object?> snapshot) {
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
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          widget._detailsViewModel.streamOverView.value.image,
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            right: 5,
                            bottom: 5,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      widget._detailsViewModel.streamOverView
                                          .value.aggregateLikes
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(right: 16)),
                                Column(
                                  children: [
                                    Icon(Icons.watch_later_outlined,
                                        size: 24, color: Colors.white),
                                    Text(
                                      widget._detailsViewModel.streamOverView
                                          .value.readyInMinutes
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 24, left: 16),
                      child: Text(
                          widget._detailsViewModel.streamOverView.value.title,
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 67),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: CustomColors.isDisableColor(widget
                                        ._detailsViewModel
                                        .streamOverView
                                        .value
                                        .vegan),
                                    size: 20,
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                  Text("Vegan",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: CustomColors.isDisableColor(widget
                                        ._detailsViewModel
                                        .streamOverView
                                        .value
                                        .vegetarian),
                                    size: 20,
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                  Text("Vegetarian",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: CustomColors.isDisableColor(widget
                                        ._detailsViewModel
                                        .streamOverView
                                        .value
                                        .dairyFree),
                                    size: 20,
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                  Text("Dairy Free",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: CustomColors.isDisableColor(widget
                                        ._detailsViewModel
                                        .streamOverView
                                        .value
                                        .glutenFree),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                  Text("Gluten Free",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: CustomColors.isDisableColor(widget
                                        ._detailsViewModel
                                        .streamOverView
                                        .value
                                        .veryHealthy),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                  Text("Healthy",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: CustomColors.isDisableColor(widget
                                        ._detailsViewModel
                                        .streamOverView
                                        .value
                                        .cheap),
                                    size: 20,
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                  Text("Cheap",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                      child: Text(
                        AppLocalizations.of(context)?.description ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Text(
                        widget._detailsViewModel.streamOverView.value.summary
                            .removeHtml(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10))
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
