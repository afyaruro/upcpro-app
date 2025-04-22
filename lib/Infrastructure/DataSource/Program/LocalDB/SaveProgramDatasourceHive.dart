import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Program/ProgramModel.dart';

class SaveProgramDataSourceHive {
  SaveProgramDataSourceHive();

  Future<bool> savePrograms(List<ProgramModel> programs, Box box) async { 

    try {
      for (var program in programs) {
        await box.put(program.id, program.toJson());
      }

      return true;
    } catch (e) {
      return false;
    }
  }
  
}
