import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/Faculty/FacultyEntity.dart';
import 'package:upcpro_app/Domain/Ports/Faculty/IFacultyRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Faculty/FacultyModel.dart';

class FacultyService {
  final IFacultyRepository repository;

  FacultyService({required this.repository});

  Future<ResponseEntity<FacultyEntity>> getFacultyDio() async {
    var respModel = await repository.getFacultyDio();
    ResponseEntity<FacultyEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = FacultyEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<ResponseEntity<FacultyEntity>> getFacultyHive(Box box) async {
    var respModel = await repository.getFacultiesHive(box);
    ResponseEntity<FacultyEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = FacultyEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<bool> saveFacultiesHive(List<FacultyModel> faculties, Box box) async {
    return await repository.saveFacultiesHive(faculties, box);
  }
}
