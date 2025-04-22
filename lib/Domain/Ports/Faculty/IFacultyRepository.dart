
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Faculty/FacultyModel.dart';

abstract class IFacultyRepository {

  Future<ResponseEntity<FacultyModel>> getFacultiesHive( Box box); 

  Future<ResponseEntity<FacultyModel>> getFacultyDio();

  Future<bool> saveFacultiesHive(List<FacultyModel> faculties, Box box);


}
