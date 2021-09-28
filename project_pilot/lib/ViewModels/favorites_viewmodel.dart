import 'package:project_pilot/models/recipe_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base_viewmodel.dart';

class FavoritesViewModel {
  var streamData = BehaviorSubject<List<RecipeModel>>();
  var streamListFilter = BehaviorSubject<List<RecipeModel>>();

  void getListRecipesFromLocal() async {
    var listRecipes = await BaseViewModel.favoriteRecipeDao.getAllRecipes();
    streamData.sink.add(listRecipes);
    unselectAll();
  }

  void deleteAllFavoriteRecipes() async {
    await BaseViewModel.favoriteRecipeDao.deleteAll();
    getListRecipesFromLocal();
  }


  void changeListFilter(RecipeModel element, bool value) {
    final listFavoritesFilter = streamListFilter.value;
    if (!value) {
      listFavoritesFilter.add(element);
    } else {
      listFavoritesFilter.removeWhere((item) {
        return item == element;
      });
    }
    streamListFilter.sink.add(listFavoritesFilter);
  }
  void unselectAll() {
    streamListFilter.sink.add([]);
  }

  void deleteSelectedItem() async{
    await BaseViewModel.favoriteRecipeDao.deleteRecipes(streamListFilter.value);
    getListRecipesFromLocal();
  }

  void dispose() {
    streamData.close();
    streamListFilter.close();
  }


}
