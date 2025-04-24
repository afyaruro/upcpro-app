import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/RespuestaPreguntaEntity.dart';
import 'package:upcpro_app/Infrastructure/Models/InfoQuestion/InfoQuestionModel.dart';
import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

class RespuestaPreguntaModel extends QuestionModel {
  final int selectedOption;
  final bool isResponse;
  final InfoQuestionModel? infoQuestion;

  RespuestaPreguntaModel({
    this.infoQuestion,
    required super.id,
    required super.enunciated,
    required super.feedback,
    required super.optionType,
    required super.optionA,
    required super.optionB,
    required super.optionC,
    required super.optionD,
    required super.correctAnswer,
    required super.typeQuestion,
    super.idInfoQuestion,
    required super.idCompetence,
    super.dateUpdate,
    required this.isResponse,
    required this.selectedOption,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      "selectedOption": selectedOption,
      "isResponse": isResponse,
      "id": id,
      "enunciated": enunciated,
      "feedback": feedback,
      "optionType": optionType,
      "optionA": optionA,
      "optionB": optionB,
      "optionC": optionC,
      "optionD": optionD,
      "correctAnswer": correctAnswer,
      "typeQuestion": typeQuestion,
      "infoQuestion": infoQuestion!.toJson(),
      "idCompetence": idCompetence,
    };
  }

  RespuestaPreguntaEntity toEntity() {
    return RespuestaPreguntaEntity(
      id: id,
      enunciated: enunciated,
      feedback: feedback,
      optionType: optionType,
      optionA: optionA,
      optionB: optionB,
      optionC: optionC,
      optionD: optionD,
      correctAnswer: correctAnswer,
      typeQuestion: typeQuestion,
      infoQuestion: infoQuestion!.toEntity(),
      idCompetence: idCompetence,
      isResponse: isResponse,
      selectedOption: selectedOption,
    );
  }

  factory RespuestaPreguntaModel.fromJsonHive(Map<dynamic, dynamic> json) {
    return RespuestaPreguntaModel(
      id: json['id'] as String? ?? "",
      enunciated: json['enunciated'] as String? ?? "",
      feedback: json['feedback'] as String? ?? "",
      optionType: json['optionType'] as String? ?? "",
      optionA: json['optionA'] as String? ?? "",
      optionB: json['optionB'] as String? ?? "",
      optionC: json['optionC'] as String? ?? "",
      optionD: json['optionD'] as String? ?? "",
      correctAnswer: json['correctAnswer'] as int? ?? 0,
      infoQuestion: InfoQuestionModel.fromJsonHive(json['infoQuestion']),
      idCompetence: json['idCompetence'] as String? ?? "",
      typeQuestion: json['typeQuestion'] as String? ?? "",
      selectedOption: json['selectedOption'] as int? ?? 0,
      isResponse: json['isResponse'] as bool? ?? false,
    );
  }

  static List<Map<dynamic, dynamic>> toJsonList(
    List<RespuestaPreguntaModel> listRespuesta,
  ) {
    return listRespuesta.map((respuesta) => respuesta.toJson()).toList();
  }

  static List<RespuestaPreguntaModel> fromEntityToListModel(
    List<RespuestaPreguntaEntity> list,
  ) {
    List<RespuestaPreguntaModel> certificadosModel = [];

    for (var item in list) {
      RespuestaPreguntaModel certificado = item.toModel();
      certificadosModel.add(certificado);
    }

    return certificadosModel;
  }

  static List<RespuestaPreguntaEntity> fromModelToListEntity(
    List<RespuestaPreguntaModel> list,
  ) {
    List<RespuestaPreguntaEntity> certificadosModel = [];

    for (var item in list) {
      RespuestaPreguntaEntity certificado = item.toEntity();
      certificadosModel.add(certificado);
    }

    return certificadosModel;
  }

  static List<RespuestaPreguntaModel> fromMapToListModel(dynamic json) {
    List<RespuestaPreguntaModel> list = [];

    if (json is List) {
      for (var item in json) {
        RespuestaPreguntaModel question = RespuestaPreguntaModel.fromJsonHive(
          item,
        );

        list.add(question);
      }
    }

    return list;
  }
}
