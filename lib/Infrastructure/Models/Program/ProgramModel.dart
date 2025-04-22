import 'package:upcpro_app/Domain/Entities/Program/ProgramEntity.dart';

class ProgramModel {
  final String id;
  final String idFaculty;
  final String name;
  final DateTime dateUpdate;

  ProgramModel({
    required this.id,
    required this.name,
    required this.dateUpdate,
    required this.idFaculty
  });

  factory ProgramModel.fromJsonDio(Map<dynamic, dynamic> json) {
    return ProgramModel(
      id: json['id'] as String? ?? "",
      idFaculty: json['faculty']['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  factory ProgramModel.fromJsonHive(Map<dynamic, dynamic> json) {
    return ProgramModel(
      id: json['id'] as String? ?? "",
      idFaculty: json['idFaculty'] as String? ?? "",
      name: json['name'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  ProgramEntity toEntity() {
    return ProgramEntity(id: id, name: name, dateUpdate: dateUpdate, idFaculty: idFaculty);
  }

  Map<dynamic, dynamic> toJson() {
    return {"id": id, "name": name, "dateUpdate": dateUpdate, "idFaculty": idFaculty};
  }

  static List<Map<dynamic, dynamic>> toJsonList(
    List<ProgramModel> Programs,
  ) {
    return Programs.map((Program) => Program.toJson()).toList();
  }

  static List<ProgramModel> toListModelHive(dynamic result) {
    List<ProgramModel> ProgramList = [];

    if (result is List) {
      for (var item in result) {
        ProgramModel Program = ProgramModel.fromJsonHive(item);
        ProgramList.add(Program);
      }
    }

    return ProgramList;
  }

  static List<ProgramModel> toListModelDio(dynamic result) {
    List<ProgramModel> ProgramList = [];

    if (result is List) {
      for (var item in result) {
        ProgramModel Program = ProgramModel.fromJsonDio(item);
        ProgramList.add(Program);
      }
    }

    return ProgramList;
  }
}
