import 'package:project_pilot/models/recipe_model.dart';
import 'package:rxdart/rxdart.dart';

import 'main_viewmodel.dart';

class FavoritesViewModel {
  var streamData = BehaviorSubject<List<RecipeModel>>();

  void getListRecipesFromLocal() async {
    var listRecipes = await MainViewModel.favoriteRecipeDao.getAllRecipes();
    streamData.sink.add(listRecipes);
  }

  void deleteAllFavoriteRecipes() async {
    await MainViewModel.favoriteRecipeDao.deleteAll();
    getListRecipesFromLocal();
  }

  void dispose() {
    streamData.close();
  }
}
