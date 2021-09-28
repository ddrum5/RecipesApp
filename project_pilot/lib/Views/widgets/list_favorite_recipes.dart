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

class ListFavoriteRecipes extends StatefulWidget {
  final BehaviorSubject<List<RecipeModel>> streamListRecipes;
  final FavoritesViewModel favoritesViewModel;

  ListFavoriteRecipes(this.streamListRecipes, this.favoritesViewModel);

  @override
  _ListFavoriteRecipesState createState() => _ListFavoriteRecipesState();
}

class _ListFavoriteRecipesState extends State<ListFavoriteRecipes> {
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
            widget.favoritesViewModel.unselectAll();
          },
          onLongPress: () {
              widget.favoritesViewModel.changeListFilter(
                widget.streamListRecipes.value[index],
                widget.favoritesViewModel.streamListFilter.value
                    .contains(widget.streamListRecipes.value[index]),
              );


          },
          child: StreamBuilder(
              stream: widget.favoritesViewModel.streamListFilter,
              builder: (context, snapshot) {
                return Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  decoration: BoxDecoration(
                    color: widget.favoritesViewModel.streamListFilter.value
                            .contains(widget.streamListRecipes.value[index])
                        ? CustomColors.blueSuperLight
                        : Colors.white,
                    border: Border.all(
                      color: widget.favoritesViewModel.streamListFilter.value
                              .contains(widget.streamListRecipes.value[index])
                          ? CustomColors.purplishBlue
                          : CustomColors.grayLite,
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
                            imageUrl:
                                widget.streamListRecipes.value[index].imageUrl,
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
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                alignment: Alignment.centerLeft,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 16)),
                              Text(
                                widget
                                    .streamListRecipes.value[index].description
                                    .removeHtml(),
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
                                            color: CustomColors.red,
                                            fontSize: 14),
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
                                            color: CustomColors.orange,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 14)),
                                  Column(
                                    children: [
                                      Icon(Icons.eco,
                                          color: CustomColors.isDisableColor(
                                              widget.streamListRecipes
                                                  .value[index].isVegan),
                                          size: 24),
                                      Text(
                                        "Vegan",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: CustomColors.isDisableColor(
                                              widget.streamListRecipes
                                                  .value[index].isVegan),
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
                );
              }),
        );
      },
    );
  }
}
