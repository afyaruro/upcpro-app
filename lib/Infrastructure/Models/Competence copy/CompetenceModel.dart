import 'package:upcpro_app/Domain/Entities/Competence/CompetenceEntity.dart';

class CompetenceModel {
  final String id;
  final String name;
  final DateTime dateUpdate;

  CompetenceModel({
    required this.id,
    required this.name,
    required this.dateUpdate,
  });

  factory CompetenceModel.fromJson(Map<dynamic, dynamic> json) {
    return CompetenceModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  CompetenceEntity toEntity() {
    return CompetenceEntity(id: id, name: name, dateUpdate: dateUpdate);
  }

  Map<dynamic, dynamic> toJson() {
    return {"id": id, "name": name, "dateUpdate": dateUpdate};
  }

  static List<Map<dynamic, dynamic>> toJsonList(
    List<CompetenceModel> competences,
  ) {
    return competences.map((competence) => competence.toJson()).toList();
  }

  static List<CompetenceModel> toListModel(dynamic result) {
    List<CompetenceModel> competenceList = [];

    if (result is List) {
      for (var item in result) {
        CompetenceModel competence = CompetenceModel.fromJson(item);
        competenceList.add(competence);
      }
    }

    return competenceList;
  }
}
