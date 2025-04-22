import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:upcpro_app/Application/Services/Competence/CompetenceService.dart';
import 'package:upcpro_app/Application/Services/Faculty/FacultyService.dart';
import 'package:upcpro_app/Application/Services/Program/ProgramService.dart';
import 'package:upcpro_app/Application/Services/Simulacro/SimulacroService.dart';
import 'package:upcpro_app/Domain/Entities/Competence/CompetenceEntity.dart';
import 'package:upcpro_app/Domain/Entities/Faculty/FacultyEntity.dart';
import 'package:upcpro_app/Domain/Entities/Program/ProgramEntity.dart';
import 'package:upcpro_app/Domain/Entities/Simulacro/SimulacroEntity.dart';

part 'genericStore.g.dart';

class StoreGeneric = _StoreGeneric with _$StoreGeneric;

abstract class _StoreGeneric with Store {
  @observable
  List<FacultyEntity> faculties = [];

  @observable
  List<CompetenceEntity> competences = [];

  @observable
  List<ProgramEntity> programs = [];

  @observable
  List<SimulacroEntity> simulacros = [];

  @action
  Future getFaculties(Box box) async {
    final service = GetIt.instance<FacultyService>();
    var resp = await service.getFacultyHive(box);
    faculties = resp.entities!;
  }

  @action
  Future getPrograms(Box box) async {
    final service = GetIt.instance<ProgramService>();
    var resp = await service.getProgramHive(box);
    programs = resp.entities!;
  }

  @action
  Future getCompetence(Box box) async {
    final service = GetIt.instance<CompetenceService>();
    var resp = await service.getCompetenceHive(box);
    competences = resp.entities!;
  }

  @action
  Future getSimulacros(Box box) async {
    final service = GetIt.instance<SimulacroService>();
    var resp = await service.getSimulacroHive(box);
    simulacros = resp.entities!;
  }
  
}
