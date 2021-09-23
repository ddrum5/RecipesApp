
import 'package:floor/floor.dart';
import 'package:project_pilot/models/recipe_model.dart';

@dao
abstract class RecipeDao {
  @Query('SELECT * FROM Recipe WHERE id = :id')
  Future<RecipeModel?> findRecipeById(int id);

  @Query('SELECT * FROM Recipe')
  Future<List<RecipeModel>> getAllRecipes();

  @Query('SELECT * FROM Recipe')
  Stream<List<RecipeModel>> getAllRecipesAsStream();

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
