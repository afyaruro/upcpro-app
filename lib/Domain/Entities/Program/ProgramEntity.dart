import 'package:upcpro_app/Infrastructure/Models/Program/ProgramModel.dart';

class ProgramEntity {
  final String id;
  final String idFaculty;
  final String name;
  final DateTime dateUpdate;

  ProgramEntity({
    required this.id,
    required this.name,
    required this.dateUpdate,
    required this.idFaculty,
  });

  ProgramModel toModel() {
    return ProgramModel(
      id: id,
      name: name,
      dateUpdate: dateUpdate,
      idFaculty: idFaculty,
    );
  }

  static List<ProgramEntity> toListEntity(List<ProgramModel> competences) {
    return competences.map((competence) => competence.toEntity()).toList();
  }

  static List<ProgramModel> toListModel(List<ProgramEntity> competences) {
    return competences.map((competence) => competence.toModel()).toList();
  }
}
