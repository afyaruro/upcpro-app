import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/InfoQuestion/InfoQuestionModel.dart';

class SaveInfoQuestionDataSourceHive {
  SaveInfoQuestionDataSourceHive();

  Future<bool> saveInfoQuestion(List<InfoQuestionModel> infoQuestions, Box box) async {
    try {

      for (var infoQuestion in infoQuestions) {
        await box.put(infoQuestion.id, infoQuestion.toJson());
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
