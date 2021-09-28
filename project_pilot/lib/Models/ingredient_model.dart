import 'package:project_pilot/Helper/extentions/map_extension.dart';

class IngredientModel {
  String imageUrl = "";
  String name = "";
  String original = "";

  IngredientModel.fromJson(Map<String, dynamic> jsonData) {
    this.imageUrl = jsonData.getString('image').isNotEmpty
        ? "https://spoonacular.com/cdn/ingredients_250x250/" +
            jsonData.getString('image')
        : "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png";
    this.name = jsonData.getString('name');
    this.original = jsonData.getString('original');
  }
}
