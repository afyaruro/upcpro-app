import 'package:upcpro_app/Infrastructure/Models/Question/QuestionModel.dart';

class QuestionEntity {
  final String id;
  final String enunciated;
  final String feedback;
  final String optionType;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final int correctAnswer;
  final String typeQuestion;
  final String idInfoQuestion;
  final String idCompetence;
  final DateTime dateUpdate;

  QuestionEntity({
    required this.id,
    required this.enunciated,
    required this.feedback,
    required this.optionType,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
    required this.typeQuestion,
    required this.idInfoQuestion,
    required this.idCompetence,
    required this.dateUpdate,
  });

  QuestionModel toModel() {
    return QuestionModel(
      id: id,
      correctAnswer: correctAnswer,
      enunciated: enunciated,
      feedback: feedback,
      idCompetence: idCompetence,
      idInfoQuestion: idInfoQuestion,
      optionA: optionA,
      optionB: optionB,
      optionC: optionC,
      optionD: optionD,
      optionType: optionType,
      typeQuestion: typeQuestion,
      dateUpdate: dateUpdate,
    );
  }

  static List<QuestionEntity> toListEntity(List<QuestionModel> competences) {
    return competences.map((competence) => competence.toEntity()).toList();
  }

  static List<QuestionModel> toListModel(List<QuestionEntity> competences) {
    return competences.map((competence) => competence.toModel()).toList();
  }
}
