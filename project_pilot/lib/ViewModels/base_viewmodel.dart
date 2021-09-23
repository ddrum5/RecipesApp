import 'package:project_pilot/BusinessLayers/LocalDatabases/database.dart';
import 'package:project_pilot/BusinessLayers/LocalDatabases/recipe_dao.dart';

class BaseViewModel {
  static RecipeDao? recipeDao;
  static Future<void> getRecipeDao () async{
    if (recipeDao == null) {
      final database = await $FloorFlutterDatabase
          .databaseBuilder('flutter_database.db')
          .build();
      recipeDao = database.recipeDao;
    }
  }



}