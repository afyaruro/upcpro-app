import 'package:upcpro_app/Domain/Entities/InfoQuestion/InfoQuestionEntity.dart';
import 'package:upcpro_app/Domain/Entities/Question/QuestionEntity.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/RespuestaPreguntaModel.dart';

class RespuestaPreguntaEntity extends QuestionEntity {
  late int selectedOption;
  late bool isResponse;
  final InfoQuestionEntity? infoQuestion;

  RespuestaPreguntaEntity({
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

  RespuestaPreguntaModel toModel() {
    return RespuestaPreguntaModel(
      id: id,
      correctAnswer: correctAnswer,
      dateUpdate: dateUpdate,
      enunciated: enunciated,
      feedback: feedback,
      idCompetence: idCompetence,
      idInfoQuestion: idInfoQuestion,
      isResponse: isResponse,
      optionA: optionA,
      optionB: optionB,
      optionC: optionC,
      optionD: optionD,
      optionType: optionType,
      selectedOption: selectedOption,
      typeQuestion: typeQuestion,
      infoQuestion: infoQuestion!.toModel(),
    );
  }
}
