class OverviewModel {
  String image = '';
  int aggregateLikes = 0;
  int readyInMinutes = 0;
  String title = '';
  bool vegan = false;
  bool vegetarian = false;
  bool dairyFree = false;
  bool glutenFree = false;
  bool veryHealthy=false;
  bool cheap= false;
  String summary = '';

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
