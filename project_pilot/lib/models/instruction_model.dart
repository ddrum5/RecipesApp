class InstructionModel {
  String step ="";

  InstructionModel.fromJson(Map<String, dynamic> jsonData) {
    this.step = jsonData['step'];
  }
}