import 'dart:convert';
import 'package:http/http.dart';
import 'package:project_pilot/Models/detail_model.dart';
import 'package:project_pilot/Models/ingredient_model.dart';
import 'package:project_pilot/Models/instruction_model.dart';
import 'package:project_pilot/Models/overview_model.dart';
import 'package:project_pilot/Models/recipe_model.dart';
import 'package:project_pilot/BusinessLayers/network/networking.dart';
import 'package:project_pilot/BusinessLayers/network/request_type.dart';
import 'package:project_pilot/Helper/extentions/map_extension.dart';

class RecipeServices {
  static RecipeServices? _responseData;

  static RecipeServices getInstance() {
    if (_responseData == null) {
      _responseData = RecipeServices();
    }
    return _responseData!;
  }

  // 21c22adaa4a1410287cdea8b8d49f86f
  // be6f7e4d1bfd487e93995dc0b910ce30
  // 1c4ecac0cd6b4d3c85de0c06b664fb96
  final String apiKey = "be6f7e4d1bfd487e93995dc0b910ce30";
  final String baseUrl = "https://api.spoonacular.com/recipes";
  final int randomRecipeNumber = 15;


  Networking client = Networking(Client());

  Future<List<RecipeModel>> getRandomRecipes() async {
    List<RecipeModel> listRecipes = <RecipeModel>[];
    String url = "$baseUrl/random"
        "?number=$randomRecipeNumber"
        "&apiKey=$apiKey";
    try {
      final response = await client.request(path: url, type: RequestType.GET);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        var results = jsonData.getList('recipes');
        listRecipes = results.map((e) => RecipeModel.fromJson(e)).toList();
      }
      return listRecipes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RecipeModel>> getSearchRecipes(String text) async {
    List<RecipeModel> listRecipes = <RecipeModel>[];
    String url = "$baseUrl/complexSearch"
        "?titleMatch=$text"
        "&apiKey=$apiKey"
        "&addRecipeInformation=true";
    try {
      final response = await client.request(path: url, type: RequestType.GET);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        var results = jsonData.getList('results');
        listRecipes = results.map((e) => RecipeModel.fromJson(e)).toList();
      }
      return listRecipes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RecipeModel>> getFilterRecipes(
      String dietType, String mealType) async {
    List<RecipeModel> listRecipes = <RecipeModel>[];
    String url = "$baseUrl/complexSearch"
        "?diet=$dietType"
        "&type=$mealType"
        "&apiKey=$apiKey"
        "&addRecipeInformation=true";
    try {
      final response = await client.request(path: url, type: RequestType.GET);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        var results = jsonData.getList('results');
        listRecipes = results.map((e) => RecipeModel.fromJson(e)).toList();
      }
      return listRecipes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DetailsModel> getDetailRecipeData(int id) async {
    DetailsModel detailsModel = DetailsModel();
    String url = "$baseUrl"
        "/$id"
        "/information"
        "?apiKey=$apiKey";
    try {
      final response = await client.request(path: url, type: RequestType.GET);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final ingredientsJsonData = jsonData.getList('extendedIngredients');
        final analyzedInstructions = jsonData.getList('analyzedInstructions');
        final analyzedInstructionsMap =
            analyzedInstructions.first as Map<String, dynamic>;
        final instructionsJsonData = analyzedInstructionsMap.getList('steps');

        detailsModel.overviewModel = OverviewModel.fromJson(jsonData);
        detailsModel.ingredientModels = ingredientsJsonData
            .map((e) => IngredientModel.fromJson(e))
            .toList();
        detailsModel.instructionModels = instructionsJsonData
            .map((e) => InstructionModel.fromJson(e))
            .toList();
      }
      return detailsModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
