class IngredientModel {
  String? imageUrl;
  String? name;
  String? original;

  IngredientModel.fromJson(Map<String, dynamic> jsonData) {
    this.imageUrl = "https://spoonacular.com/cdn/ingredients_250x250/" + jsonData['image'];
    this.name = jsonData['name'];
    this.original = jsonData['original'];
  }
}

