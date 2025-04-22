import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Ports/Competence/ICompetenceRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Competence/LocalDB/GetCompetenceDataSourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Competence/LocalDB/SaveCompetenceDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Competence/Peticiones/GetCompetenceDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/Models/Competence/CompetenceModel.dart';

class CompetenceRepository implements ICompetenceRepository {
  final Dio dio;

  CompetenceRepository({required this.dio});

  @override
  Future<ResponseEntity<CompetenceModel>> getCompetenceDio() async {
    return await GetCompetenceDataSourceDio(
      dio: dio,
    ).getCompetences(page: 1, size: 4);
  }

  @override
  Future<ResponseEntity<CompetenceModel>> getCompetenceHive(Box box) async {
    return await GetCompetenceDataSourceHive().getCompetences(box);
  }

  @override
  Future<bool> saveCompetencesHive(
    List<CompetenceModel> competences,
    Box box,
  ) async {
    return await SaveCompetenceDataSourceHive().saveCompetences(competences, box);
  }
}
