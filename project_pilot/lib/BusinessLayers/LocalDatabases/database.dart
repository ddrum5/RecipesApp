

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:project_pilot/BusinessLayers/LocalDatabases/favorite_recipe_dao.dart';
import 'package:project_pilot/Models/recipe_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [RecipeModel])
abstract class FlutterDatabase extends FloorDatabase {
  FavoriteRecipeDao get favoriteRecipeDao;
}
