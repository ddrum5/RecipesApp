import 'package:project_pilot/models/overview_model.dart';
import 'package:project_pilot/network/response_data.dart';
import 'package:rxdart/rxdart.dart';

class OverviewViewModel {

  static OverviewViewModel? _overviewViewModel;

  static OverviewViewModel getInstance() {
    if (_overviewViewModel == null) {
      _overviewViewModel = OverviewViewModel();
    }
    return _overviewViewModel!;
  }

  ResponseData response = ResponseData.getInstance();
  BehaviorSubject<OverviewModel> liveData = BehaviorSubject();

  void getData(int id) async {
    var data = await response.getDetailRecipeData(id);
    liveData.sink.add(data.overviewModel);
  }

  void dispose() {
    liveData.close();
  }
}
