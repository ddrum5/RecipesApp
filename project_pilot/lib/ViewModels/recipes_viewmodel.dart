import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/BusinessLayers/network/recipes_service.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel {
  var randomRecipesData = <RecipeModel>[];
  var streamData = BehaviorSubject<List<RecipeModel>>();
  var isSearching = BehaviorSubject<bool>();

  RecipesViewModel() {
    isSearching.sink.add(false);
  }

  var response = RecipeServices.getInstance();

  void getRandomRecipes() async {
    randomRecipesData = await response.getRandomRecipes();
    streamData.sink.add(randomRecipesData);
  }

  void getSearchRecipes( String text) async {
    randomRecipesData = await response.getSearchRecipes(text);
    getFilterRecipes();
  }

  void getFilterRecipesByTypes() async {
    randomRecipesData = await response.getFilterRecipes(dietFilter, mealFilter);
    getFilterRecipes();
  }

  void getFilterRecipes() {
    var listRecipesFilter = <RecipeModel>[];
    listRecipesFilter.addAll(randomRecipesData);
    switch (recipeFilter) {
      case 'Most Like':
        listRecipesFilter.sort((a, b) {
          return -a.likesNumber.compareTo(b.likesNumber);
        });
        break;
      default:
        listRecipesFilter.clear();
        listRecipesFilter.addAll(randomRecipesData);
        break;
    }
    streamData.sink.add(listRecipesFilter);
  }

  void changeSearchState() {
    isSearching.value
        ? isSearching.sink.add(false)
        : isSearching.sink.add(true);
  }

  final mealTypes = [
    'Main Course',
    'Snack',
    'Dessert',
    'Appetizer',
    'Drink',
    'Salad',
    'Finger Food'
  ];
  final dietTypes = [
    'Vegan',
    'Vegetarian',
    'Ketogenic',
    'Dairy Free',
    'Gluten Free',
    'Paleo',
    'Lacto-Vegetarian'
  ];

  final recipeTypes = [
    'All',
    'Newest',
    'Top Rate',
    'Most Popular',
    'Trendy',
    'Most Like'
  ];

  String mealFilter = '';
  String dietFilter = '';
  String recipeFilter = '';

  void mealFilterState(String element, bool value) {
    value ? mealFilter = element : mealFilter = '';
  }

  void dietFilterState(String element, bool value) {
    value ? dietFilter = element : dietFilter = '';
  }

  void recipeFilterState(String element, bool value) {
    value ? recipeFilter = element : recipeFilter = '';

    /*if (value) {
      recipeFilters.add(element);
    } else {
      recipeFilters.removeWhere((item) {
        return item == element;
      });
    }*/
  }

  void dispose() {
    streamData.close();
    isSearching.close();
  }
}
