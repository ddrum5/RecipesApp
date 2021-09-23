
import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/BusinessLayers/network/response_data.dart';
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

  getSearchRecipes({required String text}) async {
    var data = <RecipeModel>[];
    data = await response.getSearchRecipes(text);
    streamData.sink.add(data);
  }
  getFilterRecipes({required String dietType, required String mealType}) async {
    var data = <RecipeModel>[];
    data = await response.getFilterRecipes(dietType, mealType);
    streamData.sink.add(data);
  }

  changeSearchState() {
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
  final recipeFilters = <String>[];

  mealFilterState(String element, bool value) {
    value ? mealFilter = element : mealFilter = '';
  }
  void dietFilterState(String element, bool value) {
    value ? dietFilter = element : dietFilter = '';
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
