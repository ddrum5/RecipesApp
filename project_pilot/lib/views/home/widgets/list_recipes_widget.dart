import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project_pilot/helper/custom_color.dart';

import 'package:project_pilot/ViewModels/home/recipes_viewmodel.dart';
import 'package:project_pilot/views/detail_screen.dart';

class ListRecipesWidget extends StatefulWidget {

  final RecipesViewModel recipesViewModel;

  ListRecipesWidget(this.recipesViewModel);


  @override
  _ListRecipesWidgetState createState() => _ListRecipesWidgetState();
}

class _ListRecipesWidgetState extends State<ListRecipesWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.recipesViewModel.streamData.value.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        widget.recipesViewModel.streamData.value[index].id)));
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(width: 1, color: CustomColor.grayLite)),
            elevation: 2,
            margin: EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                      height: 218,
                      width: 182,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.recipesViewModel.streamData.value[index]
                                  .imageUrl
                                  .toString(),
                            ),
                            fit: BoxFit.fill,
                          ))),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Align(
                        child: Text(
                          widget.recipesViewModel.streamData.value[index].title
                              .toString(),
                          maxLines: 2,
                          style: TextStyle(fontSize: 25),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 16)),
                      Html(
                        data: widget.recipesViewModel.streamData.value[index]
                            .description,
                        style: {
                          "*": Style(
                              color: CustomColor.gray,
                              fontSize: FontSize(14),
                              maxLines: 3,
                              margin: EdgeInsets.all(0))
                        },
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.favorite,
                                  color: CustomColor.red, size: 24),
                              Text(
                                widget.recipesViewModel.streamData.value[index]
                                    .likesNumber
                                    .toString(),
                                style: TextStyle(
                                    color: CustomColor.red, fontSize: 14),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(right: 14)),
                          Column(
                            children: [
                              Icon(Icons.schedule,
                                  color: CustomColor.orange, size: 24),
                              Text(
                                widget.recipesViewModel.streamData.value[index]
                                    .readyInMinutes
                                    .toString(),
                                style: TextStyle(
                                    color: CustomColor.orange, fontSize: 14),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(right: 14)),
                          Column(
                            children: [
                              Icon(Icons.eco,
                                  color: CustomColor.isDisableColor(widget
                                      .recipesViewModel
                                      .streamData
                                      .value[index]
                                      .isVegan ?? false),
                                  size: 24),
                              Text(
                                "Vegan",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CustomColor.isDisableColor(widget
                                      .recipesViewModel
                                      .streamData
                                      .value[index]
                                      .isVegan ?? false),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
