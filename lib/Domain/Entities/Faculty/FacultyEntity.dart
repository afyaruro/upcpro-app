
import 'package:upcpro_app/Infrastructure/Models/Faculty/FacultyModel.dart';

class FacultyEntity {
  
  final String id;
  final String name;
  final DateTime dateUpdate;

  FacultyEntity({
    required this.id,
    required this.name,
    required this.dateUpdate,
  });

  FacultyModel toModel() {
    return FacultyModel(
      id: id,
      name: name,
      dateUpdate: dateUpdate,
    );
  }


  static List<FacultyEntity> toListEntity(List<FacultyModel> competences) {
    return competences.map((competence) => competence.toEntity()).toList();
  }

  static List<FacultyModel> toListModel(List<FacultyEntity> competences) {
    return competences.map((competence) => competence.toModel()).toList();
  }


}