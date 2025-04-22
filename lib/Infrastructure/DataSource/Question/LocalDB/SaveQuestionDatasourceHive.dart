import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

class SaveQuestionDataSourceHive {
  SaveQuestionDataSourceHive();

  Future<bool> saveQuestions(List<QuestionModel> questions, Box box) async {
    try {

      for (var question in questions) {
        await box.put(question.id, question.toJson());
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
