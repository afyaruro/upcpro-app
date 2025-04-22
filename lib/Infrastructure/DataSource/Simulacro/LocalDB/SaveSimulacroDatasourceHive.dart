import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class SaveSimulacroDataSourceHive {
  SaveSimulacroDataSourceHive();

  Future<bool> saveSimulacros(List<SimulacroModel> simulacros, Box box) async { 

    try {
      for (var simulacro in simulacros) {
        await box.put(simulacro.id, simulacro.toJson());
      }

      return true;
    } catch (e) {
      return false;
    }
  }
  
}
