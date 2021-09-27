import 'package:floor/floor.dart';
import 'package:project_pilot/Helper/extentions/map_extension.dart';
@Entity(tableName: 'FavoriteRecipes')
class RecipeModel {
  @primaryKey
  int id = 0;
  bool isVegan = false;
  String title = '';
  int readyInMinutes = 0;
  String imageUrl = '';
  String description = '';
  int likesNumber = 0;

  RecipeModel(this.id, this.isVegan, this.title, this.readyInMinutes,
      this.imageUrl, this.description, this.likesNumber);

  RecipeModel.fromJson(Map<String, dynamic> json) {
    this.id = json.getInt('id');
    this.isVegan = json.getBool('vegan');
    this.title = json.getString('title');
    this.readyInMinutes = json.getInt('readyInMinutes');
    this.imageUrl = json.getString('image');
    this.description = json.getString('summary');
    this.likesNumber = json.getInt('aggregateLikes');
  }
}
