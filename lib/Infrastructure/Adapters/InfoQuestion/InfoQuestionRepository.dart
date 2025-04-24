import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Ports/InfoQuestion/IInfoQuestionRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/InfoQuestion/LocalDB/GetInfoQuestionDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/InfoQuestion/LocalDB/SaveInfoQuestionDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/InfoQuestion/Peticiones/GetInfoQuestionDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/Models/InfoQuestion/InfoQuestionModel.dart';

class InfoQuestionRepository implements IInfoQuestionRepository {
  final Dio dio;

  InfoQuestionRepository({required this.dio});

  @override
  Future<ResponseEntity<InfoQuestionModel>> getInfoQuestionDio(int page) async {
    return await GetInfoQuestionDataSourceDio(
      dio: dio,
    ).getIntoQuestions(page: page, size: 100);
  }

  @override
  Future<bool> saveInfoQuestionsHive(
    List<InfoQuestionModel> infoQuestions,
    Box box,
  ) async {
    return await SaveInfoQuestionDataSourceHive().saveInfoQuestion(
      infoQuestions,
      box,
    );
  }

  @override
  Future<InfoQuestionModel> getInfoQuestionsHive(String question, Box box) {
    return GetInfoQuestionDataSourceHive().getInfoQuestionById(question, box);
  }
}
