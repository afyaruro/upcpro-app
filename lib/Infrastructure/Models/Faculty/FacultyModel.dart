import 'package:upcpro_app/Domain/Entities/Faculty/FacultyEntity.dart';

class FacultyModel {
  final String id;
  final String name;
  final DateTime dateUpdate;

  FacultyModel({
    required this.id,
    required this.name,
    required this.dateUpdate,
  });

  factory FacultyModel.fromJson(Map<dynamic, dynamic> json) {
    return FacultyModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  FacultyEntity toEntity() {
    return FacultyEntity(id: id, name: name, dateUpdate: dateUpdate);
  }

  Map<dynamic, dynamic> toJson() {
    return {"id": id, "name": name, "dateUpdate": dateUpdate};
  }

  static List<Map<dynamic, dynamic>> toJsonList(
    List<FacultyModel> Facultys,
  ) {
    return Facultys.map((Faculty) => Faculty.toJson()).toList();
  }

  static List<FacultyModel> toListModel(dynamic result) {
    List<FacultyModel> FacultyList = [];

    if (result is List) {
      for (var item in result) {
        FacultyModel Faculty = FacultyModel.fromJson(item);
        FacultyList.add(Faculty);
      }
    }

    return FacultyList;
  }
}
