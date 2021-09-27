import 'package:project_pilot/Helper/extentions/map_extension.dart';
class IngredientModel {
  String imageUrl = "";
  String name = "";
  String original = "";

  IngredientModel.fromJson(Map<String, dynamic> jsonData) {
    this.imageUrl =
        "https://spoonacular.com/cdn/ingredients_250x250/" + jsonData.getString('image');
    this.name = jsonData.getString('name');
    this.original = jsonData.getString('original');
  }
}
