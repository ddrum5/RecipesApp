
import 'package:project_pilot/ViewModels/favorites_viewmodel.dart';
import 'package:project_pilot/Models/ingredient_model.dart';
import 'package:project_pilot/Models/instruction_model.dart';
import 'package:project_pilot/Models/overview_model.dart';
import 'package:project_pilot/BusinessLayers/network/recipes_service.dart';
import 'package:project_pilot/Models/recipe_model.dart';
import 'package:rxdart/rxdart.dart';
import 'base_viewmodel.dart';

class DetailsViewModel {
  final response = RecipeServices.getInstance();
  final recipeDao = BaseViewModel.favoriteRecipeDao;
  var streamOverView = BehaviorSubject<OverviewModel>();
  var streamIngredients = BehaviorSubject<List<IngredientModel>>();
  var streamInstructions = BehaviorSubject<List<InstructionModel>>();
  var streamIsRecipeExist = BehaviorSubject<bool>();
  FavoritesViewModel favoritesViewModel;

  DetailsViewModel(this.favoritesViewModel);

  void getDetailRecipeData(int id) async {
    findRecipeFromDB(id);
    var data = await response.getDetailRecipeData(id);
    streamOverView.sink.add(data.overviewModel!);
    streamIngredients.sink.add(data.ingredientModels);
    streamInstructions.sink.add(data.instructionModels);

    streamIsRecipeExist.listen((value) {
      favoritesViewModel.getListRecipesFromLocal();
      print(value);
    });
  }

  void findRecipeFromDB(int id) async {
    var findRecipe = await recipeDao.findRecipeById(id);
    streamIsRecipeExist.sink.add(findRecipe != null);
  }

  void insertRecipesToFavorite(RecipeModel recipe) async {
    await recipeDao.insertRecipe(recipe);
    findRecipeFromDB(recipe.id);
  }

  void deleteRecipeFromFavorite(RecipeModel recipe) async {
    await recipeDao.deleteRecipe(recipe);
    findRecipeFromDB(recipe.id);
  }

  void dispose() {
    streamInstructions.close();
    streamOverView.close();
    streamIngredients.close();
    streamIsRecipeExist.close();
  }
}
