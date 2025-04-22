import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

class GetQuestionDataSourceDio {
  final Dio dio;

  GetQuestionDataSourceDio({required this.dio});

  Future<ResponseEntity<QuestionModel>> getQuestions({
    required int page,
    required int size,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/question/get-all",
        data: {"page": page, "size": size},
        options: Options(validateStatus: (status) => status! <= 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        List<QuestionModel> questions = QuestionModel.toListModelDio(
          result['data'],
        );
        
        return ResponseEntity.list(
          message: result['message'],
          entities: questions,
          pages: result['totalPages'],
        );
      } else {
        if (response.statusCode == 401) {
          return ResponseEntity.error(message: "Credenciales no validas");
        }

        return ResponseEntity.error(message: result['message']);
      }
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
