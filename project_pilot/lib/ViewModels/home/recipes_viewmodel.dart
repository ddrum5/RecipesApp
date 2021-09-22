import 'package:flutter/cupertino.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/models/item_filter_model.dart';
import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/network/response_data.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel {
  static RecipesViewModel? _recipesViewModel;

  static RecipesViewModel getInstance() {
    if (_recipesViewModel == null) {
      _recipesViewModel = RecipesViewModel();
      _recipesViewModel!.isSearching.sink.add(false);
    }
    return _recipesViewModel!;
  }

  var streamData = BehaviorSubject<List<RecipeModel>>();
  var isSearching = BehaviorSubject<bool>();

  var response = ResponseData.getInstance();

  getRandomRecipes() async {
    var data = <RecipeModel>[];
    data = await response.getRandomRecipes();
    streamData.sink.add(data);
  }

  getRecipesByText({required String text}) async {
    var data = <RecipeModel>[];
    data = await response.getRecipesByText(text);
    streamData.sink.add(data);
  }

  changeSearchState() {
    isSearching.value
        ? isSearching.sink.add(false)
        : isSearching.sink.add(true);
  }


  final mealTypes = <ItemFilterModel>[
    ItemFilterModel('Main Course'),
    ItemFilterModel('Snack'),
    ItemFilterModel('Dessert'),
    ItemFilterModel('Appetizer'),
    ItemFilterModel('Drink'),
    ItemFilterModel('Salad'),
    ItemFilterModel('Finger Food')
  ];
  final dietTypes = <ItemFilterModel>[
    ItemFilterModel('Vegan'),
    ItemFilterModel('Vegetarian'),
    ItemFilterModel('Ketogenic'),
    ItemFilterModel('Dairy Free'),
    ItemFilterModel('GlutenFree'),
    ItemFilterModel('Paleo'),
    ItemFilterModel('Lacto-Vegetarian'),
  ];

  final recipeTypes = <ItemFilterModel>[
    ItemFilterModel('All'),
    ItemFilterModel('Newest'),
    ItemFilterModel('Top Rate'),
    ItemFilterModel('Most Popular'),
    ItemFilterModel('Trendy'),
    ItemFilterModel('Most Like'),
  ];

  final mealFilters = <String>[];
  final dietFilters = <String>[];
  final recipeFilters = <String>[];

  mealFilterState(String element, bool value) {
    mealTypes.where((item) => item.isSelected = value);
    if (value) {
      mealFilters.add(element);
    } else {
      mealFilters.removeWhere((item) {
        return item == element;
      });
    }
  }

  void dietFilterState(String element, bool value) {
    if (value) {
      dietFilters.add(element);
    } else {
      dietFilters.removeWhere((item) {
        return item == element;
      });
    }
  }

  void recipeFilterState(String element, bool value) {
    if (value) {
      recipeFilters.add(element);
    } else {
      recipeFilters.removeWhere((item) {
        return item == element;
      });
    }
  }
  


  void dispose() {
    streamData.close();
    isSearching.close();
  }
}
