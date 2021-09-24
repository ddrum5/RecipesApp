import 'package:floor/floor.dart';

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
    this.id = json['id'];
    this.isVegan = json['vegan'];
    this.title = json['title'];
    this.readyInMinutes = json['readyInMinutes'];
    this.imageUrl = json['image'];
    this.description = json['summary'];
    this.likesNumber = json['aggregateLikes'];
  }
}
