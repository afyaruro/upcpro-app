import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/InfoQuestion/InfoQuestionModel.dart';

class GetInfoQuestionDataSourceHive {
  GetInfoQuestionDataSourceHive();

  Future<InfoQuestionModel> getInfoQuestionById(
    String infoQuestionId,
    Box box,
  ) async {
    final data = box.get(infoQuestionId);

    InfoQuestionModel model = InfoQuestionModel.fromJsonHive(data);

    return model;
  }
}
