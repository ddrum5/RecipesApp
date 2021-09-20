class RecipeModel {
  late int id;
  bool? isVegan;
  String? title;
  int? readyInMinutes;
  String? imageUrl;
  String? description;
  int? likesNumber;

  RecipeModel(
      this.id,
        this.isVegan,
        this.title,
        this.likesNumber,
        this.description,
        this.imageUrl,
        this.readyInMinutes);

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
