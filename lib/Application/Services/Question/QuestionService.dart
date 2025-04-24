import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/Question/QuestionEntity.dart';
import 'package:upcpro_app/Domain/Ports/Question/IQuestionRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

class QuestionService {
  final IQuestionRepository repository;

  QuestionService({required this.repository});

  Future<ResponseEntity<QuestionEntity>> getQuestionDio(int page) async {
    var respModel = await repository.getQuestionDio(page);
    ResponseEntity<QuestionEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = QuestionEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    responseEntity.pages = respModel.pages;
    return responseEntity;
  }

  Future<bool> saveQuestionHive(List<QuestionModel> questions, Box box) async {
    return await repository.saveQuestionsHive(questions, box);
  }

  Future<List<QuestionEntity>> getQuestionsHive(
    List<String> questions,
    Box box,
  ) async {
    var resp = await repository.getQuestionsHive(questions, box);
    return QuestionEntity.toListEntity(resp);
  }
}
