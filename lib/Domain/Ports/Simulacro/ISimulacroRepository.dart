import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

abstract class ISimulacroRepository {
  Future<ResponseEntity<SimulacroModel>> getSimulacrosHive(Box box);

  Future<bool> saveSimulacrosHive(List<SimulacroModel> simulacros, Box box);

  Future<ResponseEntity<String>> generarSimulacroDio({
    required String id,
    required String token,
  });

  Future<ResponseEntity<SimulacroModel>> getSimulacroDio(String token);
}
