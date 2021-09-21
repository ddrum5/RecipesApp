import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/network/response_data.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel {

  static RecipesViewModel? _recipesViewModel;

  static RecipesViewModel getInstance() {
    if (_recipesViewModel == null) {
      _recipesViewModel = new RecipesViewModel();
    }
    return _recipesViewModel!;
  }

  var streamData = BehaviorSubject<List<RecipeModel>>();
  var response = ResponseData.getInstance();

  /*void getRandomRecipes() async {
    var data = <RecipeModel>[];
    data= await response.getRandomRecipes();
    streamData.sink.add(data);
  }

  void getRecipesByText({required String text}) async {
    var data = <RecipeModel>[];
    data = await response.getRecipesByText(text);
    streamData.sink.add(data);
  }*/

  void getRecipesData ({required String text}) async {
    var data = <RecipeModel>[];
    if (text.isEmpty) {
      data= await response.getRandomRecipes();
    } else {
      data = await response.getRecipesByText(text);
    }
    streamData.sink.add(data);
  }





  void dispose() {
    streamData.close();
  }
}
