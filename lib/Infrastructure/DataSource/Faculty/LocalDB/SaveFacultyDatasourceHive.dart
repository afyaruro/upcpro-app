import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Faculty/FacultyModel.dart';

class SaveFacultyDataSourceHive {
  SaveFacultyDataSourceHive();

  Future<bool> saveFaculties(List<FacultyModel> faculties, Box box) async {
    try {
      
      for (var faculty in faculties) {
        await box.put(faculty.id, faculty.toJson());
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
