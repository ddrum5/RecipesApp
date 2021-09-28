import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/Views/detail_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:project_pilot/Helper/extentions/string_extension.dart';

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
          onLongPress: () {},
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.grayLite,
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.streamListRecipes.value[index].imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ))
                      ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 20, 16),
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                              widget.streamListRecipes.value[index].title,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline6),
                          alignment: Alignment.centerLeft,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 16)),
                        Text(
                          widget.streamListRecipes.value[index].description
                              .removeHtml(),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontSize: 14, color: CustomColors.gray),
                          maxLines: 3,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.favorite,
                                    color: CustomColors.red, size: 24),
                                Text(
                                  widget.streamListRecipes.value[index]
                                      .likesNumber
                                      .toString(),
                                  style: TextStyle(
                                      color: CustomColors.red, fontSize: 14),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(right: 14)),
                            Column(
                              children: [
                                Icon(Icons.schedule,
                                    color: CustomColors.orange, size: 24),
                                Text(
                                  widget.streamListRecipes.value[index]
                                      .readyInMinutes
                                      .toString(),
                                  style: TextStyle(
                                      color: CustomColors.orange, fontSize: 14),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(right: 14)),
                            Column(
                              children: [
                                Icon(Icons.eco,
                                    color: CustomColors.isDisableColor(widget
                                        .streamListRecipes
                                        .value[index]
                                        .isVegan),
                                    size: 24),
                                Text(
                                  "Vegan",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColors.isDisableColor(widget
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
