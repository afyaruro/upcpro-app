import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/InfoQuestion/InfoQuestionEntity.dart';
import 'package:upcpro_app/Domain/Ports/InfoQuestion/IInfoQuestionRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/InfoQuestion/InfoQuestionModel.dart';

class InfoQuestionService {
  final IInfoQuestionRepository repository;

  InfoQuestionService({required this.repository});

  Future<ResponseEntity<InfoQuestionEntity>> getInfoQuestionDio(
    int page,
  ) async {
    var respModel = await repository.getInfoQuestionDio(page);
    ResponseEntity<InfoQuestionEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = InfoQuestionEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    responseEntity.pages = respModel.pages;
    return responseEntity;
  }

  Future<bool> saveInfoQuestionHive(
    List<InfoQuestionModel> infoQuestions,
    Box box,
  ) async {
    return await repository.saveInfoQuestionsHive(infoQuestions, box);
  }

  Future<InfoQuestionEntity> getInfoQuestionsHive(
    String question,
    Box box,
  ) async {
    var respModel = await repository.getInfoQuestionsHive(question, box);
    return respModel.toEntity();
  }
}
