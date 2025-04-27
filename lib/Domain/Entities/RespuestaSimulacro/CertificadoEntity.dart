import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/RespuestaPreguntaEntity.dart';
import 'package:upcpro_app/Domain/Entities/Simulacrum/SimulacroEntity.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/CertificadoModel.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/RespuestaPreguntaModel.dart';

class CertificadoEntity {
  final String? id;
  final SimulacroEntity simulacro;
  late int? duracion;
  final DateTime fecha;
  final int? numCorrectasCiudadanas;
  final int? numCorrectasIngles;
  final int? numCorrectasRazonamiento;
  final int? numCorrectasLectura;
  final int totalCiudadanas;
  final int totalIngles;
  final int totalRazonamiento;
  final int totalLectura;
  final double? puntaje;
  final List<RespuestaPreguntaEntity> listRespuesta;

  CertificadoEntity({
    required this.simulacro,
    this.duracion,
    required this.fecha,
    this.numCorrectasCiudadanas,
    this.numCorrectasIngles,
    this.numCorrectasRazonamiento,
    this.numCorrectasLectura,
    required this.totalCiudadanas,
    required this.totalIngles,
    required this.totalRazonamiento,
    required this.totalLectura,
    this.puntaje,
    required this.listRespuesta,
    this.id,
  });

  CertificadoModel toModel() {
    return CertificadoModel(
      simulacro: simulacro.toModel(),
      fecha: fecha,
      totalCiudadanas: totalCiudadanas,
      totalIngles: totalIngles,
      totalRazonamiento: totalRazonamiento,
      totalLectura: totalLectura,
      listRespuesta: RespuestaPreguntaModel.fromEntityToListModel(
        listRespuesta,
      ),
    );
  }
}
