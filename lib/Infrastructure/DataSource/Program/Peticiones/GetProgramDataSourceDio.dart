import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Program/ProgramModel.dart';

class GetProgramDataSourceDio {
  final Dio dio;

  GetProgramDataSourceDio({required this.dio});

  Future<ResponseEntity<ProgramModel>> gePrograms({
    required int page,
    required int size,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/program/get-all",
        data: {"page": page, "size": size},
        options: Options(validateStatus: (status) => status! <= 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        List<ProgramModel> programs = ProgramModel.toListModelDio(result['data']);

        return ResponseEntity.listSingle(
          message: result['message'],
          entities: programs,
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
