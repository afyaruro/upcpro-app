import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Faculty/FacultyModel.dart';

class GetFacultyDataSourceDio {
  final Dio dio;

  GetFacultyDataSourceDio({required this.dio});

  Future<ResponseEntity<FacultyModel>> getFacultys({
    required int page,
    required int size,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/Faculty/get-all",
        data: {"page": page, "size": size},
        options: Options(validateStatus: (status) => status! <= 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        List<FacultyModel> Facultys = FacultyModel.toListModel(result['data']);

        return ResponseEntity.listSingle(
          message: result['message'],
          entities: Facultys,
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
