import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/Simulacro/SimulacroEntity.dart';
import 'package:upcpro_app/Domain/Ports/Simulacro/ISimulacroRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class SimulacroService {
  final ISimulacroRepository repository;

  SimulacroService({required this.repository});

  Future<ResponseEntity<SimulacroEntity>> getSimulacroDio(String token) async {
    var respModel = await repository.getSimulacroDio(token);

    ResponseEntity<SimulacroEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = SimulacroEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<ResponseEntity<SimulacroEntity>> getSimulacroHive(Box box) async {
    var respModel = await repository.getSimulacrosHive(box);
    ResponseEntity<SimulacroEntity> responseEntity = ResponseEntity.empty();
    responseEntity.entities = SimulacroEntity.toListEntity(
      respModel.entities ?? [],
    );
    responseEntity.message = respModel.message;
    responseEntity.isError = respModel.isError;
    return responseEntity;
  }

  Future<bool> saveSimulacrosHive(
    List<SimulacroModel> Simulacros,
    Box box,
  ) async {
    return await repository.saveSimulacrosHive(Simulacros, box);
  }
}
