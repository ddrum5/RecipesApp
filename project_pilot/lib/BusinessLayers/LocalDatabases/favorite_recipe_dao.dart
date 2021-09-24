
import 'package:floor/floor.dart';
import 'package:project_pilot/models/recipe_model.dart';

@dao
abstract class FavoriteRecipeDao {
  @Query('SELECT * FROM FavoriteRecipes WHERE id = :id')
  Future<RecipeModel?> findRecipeById(int id);

  @Query('SELECT * FROM FavoriteRecipes')
  Future<List<RecipeModel>> getAllRecipes();

  @Query('SELECT * FROM FavoriteRecipes')
  Stream<List<RecipeModel>> getAllRecipesAsStream();

  @Query('DELETE FROM FavoriteRecipes')
  Future<void> deleteAll();

  @insert
  Future<void> insertRecipe(RecipeModel recipe);

  @insert
  Future<void> insertRecipes(List<RecipeModel> recipes);

  @update
  Future<void> updateRecipe(RecipeModel recipe);

  @update
  Future<void> updateRecipes(List<RecipeModel> recipe);

  @delete
  Future<void> deleteRecipe(RecipeModel recipe);

  @delete
  Future<void> deleteRecipes(List<RecipeModel> recipes);




}
