import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Program/ProgramModel.dart';

class GetProgramDataSourceHive {
  GetProgramDataSourceHive();

  Future<ResponseEntity<ProgramModel>> getPrograms(Box box) async {
    try {
      final programs = box.values.toList();

      final programsModel = ProgramModel.toListModelHive(programs);

      return ResponseEntity.listSingle(
        message: "programas obtenidas",
        entities: programsModel,
      );
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
