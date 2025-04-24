import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Ports/Question/IQuestionRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Question/LocalDB/GetQuestionDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Question/LocalDB/SaveQuestionDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Question/Peticiones/GetQuestionDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

class QuestionRepository implements IQuestionRepository {
  final Dio dio;

  QuestionRepository({required this.dio});

  @override
  Future<ResponseEntity<QuestionModel>> getQuestionDio(int page) async {
    return await GetQuestionDataSourceDio(
      dio: dio,
    ).getQuestions(page: page, size: 100);
  }

  @override
  Future<bool> saveQuestionsHive(List<QuestionModel> questions, Box box) async {
    return await SaveQuestionDataSourceHive().saveQuestions(questions, box);
  }
  
  @override
  Future<List<QuestionModel>> getQuestionsHive(List<String> questions, Box box) async {
    return await GetQuestionDataSourceHive().getQuestionsByIds(questions, box);
  }
}
