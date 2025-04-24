import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/InfoQuestion/InfoQuestionModel.dart';

abstract class IInfoQuestionRepository {
  Future<ResponseEntity<InfoQuestionModel>> getInfoQuestionDio(int page);

  Future<bool> saveInfoQuestionsHive(
    List<InfoQuestionModel> infoQuestions,
    Box box,
  );


  Future<InfoQuestionModel> getInfoQuestionsHive(String question, Box box);
}
