import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class SimulacroEntity {
  final String id;
  final int duracion;
  final int numeroPreguntas;
  final DateTime fechaLimite;
  final DateTime dateUpdate;

  SimulacroEntity({
    required this.id,
    required this.duracion,
    required this.numeroPreguntas,
    required this.fechaLimite,
    required this.dateUpdate,
  });

  SimulacroModel toModel() {
    return SimulacroModel(
      duracion: duracion,
      id: id,
      fechaLimite: fechaLimite,
      numeroPreguntas: numeroPreguntas,
      dateUpdate: dateUpdate,
    );
  }

  static List<SimulacroEntity> toListEntity(List<SimulacroModel> simulacros) {
    return simulacros.map((competence) => competence.toEntity()).toList();
  }

  static List<SimulacroModel> toListModel(List<SimulacroEntity> simulacros) {
    return simulacros.map((competence) => competence.toModel()).toList();
  }
}
