import 'package:upcpro_app/Domain/Entities/Simulacro/SimulacroEntity.dart';

class SimulacroModel {
  final String id;
  final int duracion;
  final int numeroPreguntas;
  final DateTime fechaLimite;
  final DateTime dateUpdate;

  SimulacroModel({
    required this.id,
    required this.duracion,
    required this.numeroPreguntas,
    required this.fechaLimite,
    required this.dateUpdate,
  });

  factory SimulacroModel.fromJson(Map<dynamic, dynamic> json) {
    return SimulacroModel(
      id: json['id'] as String? ?? "",
      duracion: json['duracion'] as int? ?? 0,
      numeroPreguntas: json['numeroPreguntas'] as int? ?? 0,
      fechaLimite:
          json['fechaLimite'] is String
              ? DateTime.parse(json['fechaLimite'])
              : json['fechaLimite'] as DateTime,
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  SimulacroEntity toEntity() {
    return SimulacroEntity(
      id: id,
      duracion: duracion,
      fechaLimite: fechaLimite,
      numeroPreguntas: numeroPreguntas,
      dateUpdate: dateUpdate,
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": id,
      "duracion": duracion,
      "fechaLimite": fechaLimite,
      "numeroPreguntas": numeroPreguntas,
      "dateUpdate": dateUpdate,
    };
  }

  static List<Map<dynamic, dynamic>> toJsonList(
    List<SimulacroModel> simulacros,
  ) {
    return simulacros.map((s) => s.toJson()).toList();
  }

  static List<SimulacroModel> toListModel(dynamic result) {
    List<SimulacroModel> simulacroList = [];

    if (result is List) {
      for (var item in result) {
        SimulacroModel simulacro = SimulacroModel.fromJson(item);
        simulacroList.add(simulacro);
      }
    }

    return simulacroList;
  }
}
