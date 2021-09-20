import 'dart:convert';

import 'package:http/http.dart';
import 'package:project_pilot/models/details_model.dart';
import 'package:project_pilot/models/ingredient_model.dart';
import 'package:project_pilot/models/instruction_model.dart';
import 'package:project_pilot/models/overview_model.dart';
import 'package:project_pilot/models/recipe_model.dart';
import 'package:project_pilot/network/networking.dart';
import 'package:project_pilot/network/request_type.dart';
import 'package:project_pilot/view_models/detail_viewmodel/overview_viewmodel.dart';

class ResponseData {

  static ResponseData? _responseData;

  static ResponseData getInstance() {
    if (_responseData == null) {
      _responseData = ResponseData();
    }
    return _responseData!;
  }

  final String baseUrl = "https://api.spoonacular.com/recipes";
  final int recipeNumber = 3;
  final String apiKey = "26aa0d4d45a5481a9f34bfdd4a2aee50";

  Networking client = Networking(Client());

  Future<List<RecipeModel>> getRandomRecipes() async {
    List<RecipeModel> listRecipes = <RecipeModel>[];
    String getUrl = "$baseUrl/random"
        "?number=$recipeNumber"
        "&apiKey=$apiKey";
    try {
      final response =
          await client.request(path: getUrl, type: RequestType.GET);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        var results = jsonData['recipes'] as List<dynamic>;
        listRecipes = results.map((e) => RecipeModel.fromJson(e)).toList();
      }
      return listRecipes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DetailsModel> getDetailRecipeData(int id) async {
    DetailsModel detailsModel = DetailsModel();
    String getUrl = "$baseUrl"
        "/$id"
        "/information"
        "?apiKey=$apiKey";
    try {
      final response =
      await client.request(path: getUrl, type: RequestType.GET);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final ingredientsJsonData = jsonData['extendedIngredients'] as List<dynamic>;
        final analyzedInstructions = jsonData['analyzedInstructions'] as List<dynamic>;
        // final instructionsJsonData = analyzedInstructions[0]['steps'] as List<dynamic>;

        detailsModel.overviewModel = OverviewModel.fromJson(jsonData);
        detailsModel.ingredientModels = ingredientsJsonData.map((e) => IngredientModel.fromJson(e)).toList() ;
        // detailsModel.instructionModels = instructionsJsonData.map((e) => InstructionModel.fromJson(e)).toList() ;

      }
      return detailsModel;
    } catch (e) {
      throw Exception(e);
    }
  }



}
