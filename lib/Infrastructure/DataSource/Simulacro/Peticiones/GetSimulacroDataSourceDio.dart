import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class GetSimulacroDataSourceDio {
  final Dio dio;

  GetSimulacroDataSourceDio({required this.dio});

  Future<ResponseEntity<SimulacroModel>> getSimulacros(String token) async {
    try {
      final fechaActual =
          DateTime.now()
              .subtract(const Duration(days: 1))
              .toUtc()
              .toIso8601String();

      final response = await dio.post(
        "$URLBASE/api/simulacro/get-all-active",
        data: {"fechaActual": fechaActual},
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
        List<SimulacroModel> programs = SimulacroModel.toListModel(
          result['data'],
        );

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
