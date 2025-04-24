
import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

class GetQuestionDataSourceHive {
  GetQuestionDataSourceHive();

 Future<List<QuestionModel>> getQuestionsByIds(List<String> questionIds, Box box) async {
  List<QuestionModel> result = [];

  for (var id in questionIds) {
    final data = box.get(id);
    if (data != null) {
      result.add(QuestionModel.fromJsonHive(Map<dynamic, dynamic>.from(data)));
    }
  }

  return result;
}

}
