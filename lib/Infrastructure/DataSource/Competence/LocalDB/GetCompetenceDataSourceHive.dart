import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Competence/CompetenceModel.dart';

class GetCompetenceDataSourceHive {
  GetCompetenceDataSourceHive();

  Future<ResponseEntity<CompetenceModel>> getCompetences(Box box) async {
    try {

      final competences = box.values.toList();

      final competencesModel = CompetenceModel.toListModel(competences);

      return ResponseEntity.listSingle(
        message: "Competencias obtenidas",
        entities: competencesModel,
      );

    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
