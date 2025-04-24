import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class GetSimulacroDataSourceHive {
  GetSimulacroDataSourceHive();

  Future<ResponseEntity<SimulacroModel>> getSimulacros(Box box) async {
    try {
      final simulacros = box.values.toList();

      final simulacrosModel = SimulacroModel.toListModel(simulacros);

      return ResponseEntity.listSingle(
        message: "Simulacros obtenidas",
        entities: simulacrosModel,
      );
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
