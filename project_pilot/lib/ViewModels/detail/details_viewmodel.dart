import 'package:project_pilot/models/ingredient_model.dart';
import 'package:project_pilot/models/instruction_model.dart';
import 'package:project_pilot/models/overview_model.dart';
import 'package:project_pilot/BusinessLayers/network/response_data.dart';
import 'package:rxdart/rxdart.dart';

class DetailsViewModel {

  static DetailsViewModel? _detailsViewModel;

  static DetailsViewModel getInstance() {
    if (_detailsViewModel == null) {
      _detailsViewModel = DetailsViewModel();
    }
    return _detailsViewModel!;
  }

  final response = ResponseData.getInstance();
  BehaviorSubject<OverviewModel> streamOverView = BehaviorSubject();
  BehaviorSubject<List<IngredientModel>> streamIngredients = BehaviorSubject();
  BehaviorSubject<
      List<InstructionModel>> streamInstructions = BehaviorSubject();

  void getOverViewData(int id) async {
    var data = await response.getDetailRecipeData(id);
    streamOverView.sink.add(data.overviewModel!);
    streamIngredients.sink.add(data.ingredientModels);
    streamInstructions.sink.add(data.instructionModels);
  }


  void dispose() {
    streamInstructions.close();
    streamOverView.close();
    streamIngredients.close();
  }




}