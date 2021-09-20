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

  var liveData = BehaviorSubject<List<RecipeModel>>();
  var response = ResponseData.getInstance();

  void getRandomRecipes() async {
    var listData = await response.getRandomRecipes();
    liveData.sink.add(listData);
  }

  void dispose() {
    liveData.close();
  }
}
