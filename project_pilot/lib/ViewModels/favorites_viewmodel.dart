import 'package:project_pilot/models/recipe_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base_viewmodel.dart';

class FavoritesViewModel {
  var streamData = BehaviorSubject<List<RecipeModel>>();
  var streamListFilter = BehaviorSubject<List<RecipeModel>>();
  final listFavoritesFilter = <RecipeModel>[];

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
    listFavoritesFilter.clear();
    streamListFilter.sink.add(listFavoritesFilter);
  }

  void deleteSelectedItem() async{
    await BaseViewModel.favoriteRecipeDao.deleteRecipes(listFavoritesFilter);
    getListRecipesFromLocal();
  }

  void dispose() {
    streamData.close();
    streamListFilter.close();
  }


}
