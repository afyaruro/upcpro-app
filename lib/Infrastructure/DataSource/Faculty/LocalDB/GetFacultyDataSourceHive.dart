import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Faculty/FacultyModel.dart';

class GetFacultyDataSourceHive {
  GetFacultyDataSourceHive();

  Future<ResponseEntity<FacultyModel>> getFacultys(Box box) async {
    try {
      final faculties = box.values.toList();

      final facultysModel = FacultyModel.toListModel(faculties);

      return ResponseEntity.listSingle(
        message: "facultades obtenidas",
        entities: facultysModel,
      );
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
