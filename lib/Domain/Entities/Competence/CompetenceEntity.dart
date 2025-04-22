

import 'package:upcpro_app/Infrastructure/Models/Competence/CompetenceModel.dart';

class CompetenceEntity {
  
  final String id;
  final String name;
  final DateTime dateUpdate;

  CompetenceEntity({
    required this.id,
    required this.name,
    required this.dateUpdate,
  });

  CompetenceModel toModel() {
    return CompetenceModel(
      id: id,
      name: name,
      dateUpdate: dateUpdate,
    );
  }


  static List<CompetenceEntity> toListEntity(List<CompetenceModel> competences) {
    return competences.map((competence) => competence.toEntity()).toList();
  }

  static List<CompetenceModel> toListModel(List<CompetenceEntity> competences) {
    return competences.map((competence) => competence.toModel()).toList();
  }


}