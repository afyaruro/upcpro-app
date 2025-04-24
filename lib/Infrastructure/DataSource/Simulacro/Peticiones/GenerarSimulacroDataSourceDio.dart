import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';

class GenerarSimulacroDataSourceDio {
  final Dio dio;

  GenerarSimulacroDataSourceDio({required this.dio});

  Future<ResponseEntity<String>> generarSimulacro(
    String id,
    String token,
  ) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/simulacro/generar-simulacro",
        data: {"id": id},
        options: Options(
          headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) => status! <= 500,
        ),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        List<String> stringList = List<String>.from(result['data']);

        return ResponseEntity.listSingle(
          message: result['message'],
          entities: stringList,
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
