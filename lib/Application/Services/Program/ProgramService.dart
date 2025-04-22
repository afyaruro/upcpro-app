import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/Program/ProgramEntity.dart';
import 'package:upcpro_app/Domain/Ports/Program/IProgramRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Program/ProgramModel.dart';

class ProgramService {
  final IProgramRepository repository;

  ProgramService({required this.repository});

  Future<ResponseEntity<ProgramEntity>> getProgramDio() async {
    var respModel = await repository.getProgramDio();
    ResponseEntity<ProgramEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = ProgramEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<ResponseEntity<ProgramEntity>> getProgramHive(Box box) async {
    var respModel = await repository.getProgramsHive(box);
    ResponseEntity<ProgramEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = ProgramEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<bool> saveProgramsHive(List<ProgramModel> programs, Box box) async {
    return await repository.saveProgramsHive(programs, box);
  }
}
