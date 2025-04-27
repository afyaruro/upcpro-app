import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/InfoQuestion/InfoQuestionService.dart';
import 'package:upcpro_app/Application/Services/Question/QuestionService.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Domain/Entities/Question/QuestionEntity.dart';
import 'package:upcpro_app/Domain/Entities/Simulacrum/SimulacroEntity.dart';
import 'package:upcpro_app/Domain/Ports/Simulacro/ISimulacroRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class SimulacroService {
  final ISimulacroRepository repository;

  SimulacroService({required this.repository});

  Future<ResponseEntity<SimulacroEntity>> getSimulacroDio(String token) async {
    var respModel = await repository.getSimulacroDio(token);

    ResponseEntity<SimulacroEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = SimulacroEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<ResponseEntity<SimulacroEntity>> getSimulacroHive(Box box) async {
    var respModel = await repository.getSimulacrosHive(box);
    ResponseEntity<SimulacroEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = SimulacroEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;

    List<SimulacroEntity> simulacros = [];

    for (var simulacro in responseEntity.entities!) {
      final storeGeneric = GetIt.instance<StoreGeneric>();

      if (simulacro.type == "ALL") {
        simulacro.name = "SIMULACRO COMPLETO";
        simulacros.add(simulacro);
      } else {
        for (var competence in storeGeneric.competences) {
          if (competence.id == simulacro.type) {
            simulacro.name = "SIMULACRO ${competence.name}";
            simulacros.add(simulacro);
          }
        }
      }
    }

    responseEntity.entities = simulacros;

    return responseEntity;
  }

  Future<bool> saveSimulacrosHive(
    List<SimulacroModel> simulacros,
    Box box,
  ) async {
    return await repository.saveSimulacrosHive(simulacros, box);
  }

  Future<ResponseEntity<QuestionEntity>> generarSimulacroDio({
    required String id,
    required String token,
    required Box boxQuestion,
    required Box boxInfoQuestion,
  }) async {
    var respModel = await repository.generarSimulacroDio(id: id, token: token);
    ResponseEntity<QuestionEntity> responseEntity = ResponseEntity.empty();
    if (!respModel.isError!) {
      final questionService = GetIt.instance<QuestionService>();
      final infoQuestionService = GetIt.instance<InfoQuestionService>();

      responseEntity.entities = [];

      var questionsResp = await questionService.getQuestionsHive(
        respModel.entities!,
        boxQuestion,
      );

      List<QuestionEntity> questions = [];

      for (var question in questionsResp) {
        var infoQuestion = await infoQuestionService.getInfoQuestionsHive(
          question.idInfoQuestion!,
          boxInfoQuestion,
        );

        // ignore: unnecessary_null_comparison
        if (infoQuestion != null) {
          question.infoQuestion = infoQuestion;
          questions.add(question);
        }
      }

      responseEntity.entities = questions;
    }

    return responseEntity;
  }
}
