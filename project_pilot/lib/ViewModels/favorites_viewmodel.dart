import 'package:project_pilot/models/recipe_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base_viewmodel.dart';

class FavoritesViewModel {
  var streamData = BehaviorSubject<List<RecipeModel>>();

  void getListRecipesFromLocal() async {
    var listRecipes = await BaseViewModel.favoriteRecipeDao.getAllRecipes();
    streamData.sink.add(listRecipes);
  }

  void deleteAllFavoriteRecipes() async {
    await BaseViewModel.favoriteRecipeDao.deleteAll();
    getListRecipesFromLocal();
  }

  void dispose() {
    streamData.close();
  }
}
