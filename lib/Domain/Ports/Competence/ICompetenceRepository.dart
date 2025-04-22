
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Competence/CompetenceModel.dart';

abstract class ICompetenceRepository {

  Future<ResponseEntity<CompetenceModel>> getCompetenceHive( Box box); 

  Future<ResponseEntity<CompetenceModel>> getCompetenceDio();

  Future<bool> saveCompetencesHive(List<CompetenceModel> competences, Box box);


}
