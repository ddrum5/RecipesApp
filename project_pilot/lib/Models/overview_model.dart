
import 'package:project_pilot/Helper/extentions/map_extension.dart';
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
    this.image=json.getString('image');
    this.readyInMinutes=json.getInt('readyInMinutes');
    this.title=json.getString('title');
    this.aggregateLikes=json.getInt('aggregateLikes');
    this.cheap=json.getBool('cheap');
    this.dairyFree=json.getBool('dairyFree');
    this.glutenFree=json.getBool('glutenFree');
    this.summary=json.getString('summary');
    this.vegan=json.getBool('vegan');
    this.vegetarian=json.getBool('vegetarian');
    this.veryHealthy=json.getBool('veryHealthy');
  }
}
