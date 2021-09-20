class OverviewModel {
  String? image;
  int? aggregateLikes;
  int? readyInMinutes;
  String? title;
  bool? vegan;
  bool? vegetarian;
  bool? dairyFree;
  bool? glutenFree;
  bool? veryHealthy;
  bool? cheap;
  String? summary;

  OverviewModel.fromJson(Map<String, dynamic> json) {
    this.image=json['image'];
    this.readyInMinutes=json['readyInMinutes'];
    this.title=json['title'];
    this.aggregateLikes=json['aggregateLikes'];
    this.cheap=json['cheap'];
    this.dairyFree=json['dairyFree'];
    this.glutenFree=json['glutenFree'];
    this.summary=json['summary'];
    this.vegan=json['vegan'];
    this.vegetarian=json['vegetarian'];
    this.veryHealthy=json['veryHealthy'];
  }
}
