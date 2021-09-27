import 'package:project_pilot/Helper/extentions/map_extension.dart';
class InstructionModel {
  String step = '';

  InstructionModel.fromJson(Map<String, dynamic> jsonData) {
    this.step = jsonData.getString('step');
  }
}