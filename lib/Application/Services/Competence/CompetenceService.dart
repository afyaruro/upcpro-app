import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/Competence/CompetenceEntity.dart';
import 'package:upcpro_app/Domain/Ports/Competence/ICompetenceRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Competence/CompetenceModel.dart';

class CompetenceService {
  final ICompetenceRepository repository;

  CompetenceService({required this.repository});

  Future<ResponseEntity<CompetenceEntity>> getCompetenceDio() async {
    var respModel = await repository.getCompetenceDio();
    ResponseEntity<CompetenceEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = CompetenceEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<ResponseEntity<CompetenceEntity>> getCompetenceHive(Box box) async {
    var respModel = await repository.getCompetenceHive(box);
    ResponseEntity<CompetenceEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = CompetenceEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<bool> saveCompetencesHive(List<CompetenceModel> competences, Box box) async {
    return await repository.saveCompetencesHive(competences, box);
  }
}
