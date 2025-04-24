import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Ports/Simulacro/ISimulacroRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Simulacro/LocalDB/GetSimulacroDataSourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Simulacro/LocalDB/SaveSimulacroDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Simulacro/Peticiones/GenerarSimulacroDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Simulacro/Peticiones/GetSimulacroDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class SimulacroRepository implements ISimulacroRepository {
  final Dio dio;

  SimulacroRepository({required this.dio});

  @override
  Future<ResponseEntity<SimulacroModel>> getSimulacroDio(String token) async {
    return await GetSimulacroDataSourceDio(dio: dio).getSimulacros(token);
  }

  @override
  Future<ResponseEntity<SimulacroModel>> getSimulacrosHive(Box box) async {
    return await GetSimulacroDataSourceHive().getSimulacros(box);
  }

  @override
  Future<bool> saveSimulacrosHive(
    List<SimulacroModel> simulacros,
    Box box,
  ) async {
    return await SaveSimulacroDataSourceHive().saveSimulacros(simulacros, box);
  }

  @override
  Future<ResponseEntity<String>> generarSimulacroDio({
    required String id,
    required String token,
  }) async {
    return await GenerarSimulacroDataSourceDio(
      dio: dio,
    ).generarSimulacro(id, token);
  }
}
