
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

abstract class IQuestionRepository {


  Future<ResponseEntity<QuestionModel>> getQuestionDio(int page);

  Future<bool> saveQuestionsHive(List<QuestionModel> questions, Box box);


}
