import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Competence/CompetenceModel.dart';

class GetCompetenceDataSourceDio {
  final Dio dio;

  GetCompetenceDataSourceDio({required this.dio});

  Future<ResponseEntity<CompetenceModel>> getCompetences({
    required int page,
    required int size,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/competence/get-all",
        data: {"page": page, "size": size},
        options: Options(validateStatus: (status) => status! <= 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        List<CompetenceModel> competences = CompetenceModel.toListModel(result['data']);

        return ResponseEntity.listSingle(
          message: result['message'],
          entities: competences,
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
