
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Program/ProgramModel.dart';

abstract class IProgramRepository {

  Future<ResponseEntity<ProgramModel>> getProgramsHive( Box box); 

  Future<ResponseEntity<ProgramModel>> getProgramDio();

  Future<bool> saveProgramsHive(List<ProgramModel> programs, Box box);


}
