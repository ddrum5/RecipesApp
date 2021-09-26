import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/Views/detail_screen.dart';
import 'package:rxdart/rxdart.dart';


class ListRecipesWidget extends StatefulWidget {
  final BehaviorSubject<List<RecipeModel>> streamListRecipes;
  final FavoritesViewModel favoritesViewModel;
  ListRecipesWidget(this.streamListRecipes, this.favoritesViewModel);

  @override
  _ListRecipesWidgetState createState() => _ListRecipesWidgetState();
}

class _ListRecipesWidgetState extends State<ListRecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.streamListRecipes.value.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(
                  widget.streamListRecipes.value[index],
                  DetailsViewModel(widget.favoritesViewModel),
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColor.grayLite,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 182,
                    height: 218,
                    child: CachedNetworkImage(
                      imageUrl: widget.streamListRecipes.value[index].imageUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                            widget.streamListRecipes.value[index].title,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'robotoMedium',
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 16)),
                        Html(
                          data:
                              widget.streamListRecipes.value[index].description,
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
                                  widget.streamListRecipes.value[index]
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
                                  widget.streamListRecipes.value[index]
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
                                        .streamListRecipes
                                        .value[index]
                                        .isVegan),
                                    size: 24),
                                Text(
                                  "Vegan",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColor.isDisableColor(widget
                                        .streamListRecipes
                                        .value[index]
                                        .isVegan),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
