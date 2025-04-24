import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/CertificadoEntity.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/RespuestaPreguntaModel.dart';
import 'package:upcpro_app/Infrastructure/Models/Simulacro/SimulacroModel.dart';

class CertificadoModel {
  final String? id;
  final SimulacroModel? simulacro;
  final int? duracion;
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
  final List<RespuestaPreguntaModel> listRespuesta;

  CertificadoModel({
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

  Map<dynamic, dynamic> toJsonSimulacroActivoHive() {
    return {
      "simulacro": simulacro!.toJson(),
      "fecha": fecha,
      "totalCiudadanas": totalCiudadanas,
      "totalIngles": totalIngles,
      "totalRazonamiento": totalRazonamiento,
      "totalLectura": totalLectura,
      "listRespuesta": RespuestaPreguntaModel.toJsonList(listRespuesta),
    };
  }

  CertificadoEntity toEntity() {
    return CertificadoEntity(
      simulacro: simulacro!.toEntity(),
      fecha: fecha,
      totalCiudadanas: totalCiudadanas,
      totalIngles: totalIngles,
      totalRazonamiento: totalRazonamiento,
      totalLectura: totalLectura,
      listRespuesta: RespuestaPreguntaModel.fromModelToListEntity(
        listRespuesta,
      ),
    );
  }

  factory CertificadoModel.fromJsonHive(Map<dynamic, dynamic> json) {
    return CertificadoModel(
      simulacro: SimulacroModel.fromJson(json['simulacro']),
      totalCiudadanas: json['totalCiudadanas'] as int? ?? 0,
      totalIngles: json['totalIngles'] as int? ?? 0,
      totalRazonamiento: json['totalRazonamiento'] as int? ?? 0,
      totalLectura: json['totalLectura'] as int? ?? 0,
      fecha:
          json['fecha'] is String
              ? DateTime.parse(json['fecha'])
              : json['fecha'] as DateTime,
      listRespuesta: RespuestaPreguntaModel.fromMapToListModel(
        json['listRespuesta'],
      ),
    );
  }
}
