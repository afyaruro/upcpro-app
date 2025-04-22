import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Competence/CompetenceModel.dart';

class SaveCompetenceDataSourceHive {
  SaveCompetenceDataSourceHive();

  Future<bool> saveCompetences(
    List<CompetenceModel> competences,
    Box box,
  ) async {
    try {
      
      for (var competence in competences) {
        await box.put(competence.id, competence.toJson());
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
