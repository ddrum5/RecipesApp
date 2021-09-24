import 'package:project_pilot/BusinessLayers/LocalDatabases/database.dart';
import 'package:project_pilot/BusinessLayers/LocalDatabases/favorite_recipe_dao.dart';

class BaseViewModel {
  static late FavoriteRecipeDao favoriteRecipeDao;

  static Future<void> initRecipeDao() async {
    final database = await $FloorFlutterDatabase
        .databaseBuilder('flutter_database.db')
        .build();
    favoriteRecipeDao = database.recipeDao;
  }
}
