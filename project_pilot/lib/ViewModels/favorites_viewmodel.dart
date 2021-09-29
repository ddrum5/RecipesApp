import 'package:project_pilot/models/recipe_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base_viewmodel.dart';

class FavoritesViewModel {
  var streamData = BehaviorSubject<List<RecipeModel>>();
  var streamListFilter = BehaviorSubject<List<RecipeModel>>();

  void getListRecipesFromLocal() async {
    var listRecipes = await BaseViewModel.favoriteRecipeDao.getAllRecipes();
    streamData.sink.add(listRecipes);
  }

  void deleteAllFavoriteRecipes() async {
    await BaseViewModel.favoriteRecipeDao.deleteAll();
    getListRecipesFromLocal();
  }

  void changeListFilter(RecipeModel element, bool value) {
    if (!value) {
      streamListFilter.value.add(element);
    } else {
      streamListFilter.value.removeWhere((item) {
        return item == element;
      });
    }
    streamListFilter.sink.add(streamListFilter.value);
  }

  void unselectAll() {
    streamListFilter.sink.add([]);
    streamListFilter.sink.add([]);
  }

  void deleteSelectedItem() async {
    await BaseViewModel.favoriteRecipeDao.deleteRecipes(streamListFilter.value);
    getListRecipesFromLocal();
    unselectAll();
  }

  void dispose() {
    streamData.close();
    streamListFilter.close();
  }
}
