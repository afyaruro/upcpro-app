import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:upcpro_app/Application/Services/Competence/CompetenceService.dart';
import 'package:upcpro_app/Domain/Entities/Competence/CompetenceEntity.dart';

part 'competenceStore.g.dart';

class StoreCompetence = _StoreCompetence with _$StoreCompetence;

abstract class _StoreCompetence with Store {
  @observable
  bool isLoading = false;

  @observable
  List<CompetenceEntity> competences = [];

  @action
  Future<bool> ConfigCompetence({required Box box}) async {
    try {
      isLoading = true;
      final service = GetIt.instance<CompetenceService>();

      final response = await service.getCompetenceDio();
      competences = response.entities ?? [];

      final respHive = await service.saveCompetencesHive(CompetenceEntity.toListModel(competences), box);
      isLoading = false;
      return respHive;
    } catch (e) {
      isLoading = false;
      return false;
    }
  }
}
