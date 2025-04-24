import 'package:upcpro_app/Domain/Entities/Question/QuestionEntity.dart';

class QuestionModel {
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
  final String? idInfoQuestion;
  final String idCompetence;
  final DateTime? dateUpdate;

  QuestionModel({
    required this.id,
    required this.enunciated,
    required this.feedback,
    required this.optionType,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
    required this.idInfoQuestion,
    required this.idCompetence,
    required this.typeQuestion,
    required this.dateUpdate,
  });

  factory QuestionModel.fromJsonDio(Map<dynamic, dynamic> json) {
    return QuestionModel(
      id: json['id'] as String? ?? "",
      enunciated: json['enunciated'] as String? ?? "",
      feedback: json['feedback'] as String? ?? "",
      optionType: json['optionType'] as String? ?? "",
      optionA: json['optionA'] as String? ?? "",
      optionB: json['optionB'] as String? ?? "",
      optionC: json['optionC'] as String? ?? "",
      optionD: json['optionD'] as String? ?? "",
      correctAnswer: json['correctAnswer'] as int? ?? 0,
      idInfoQuestion: json['idInfoQuestion'] as String? ?? "",
      idCompetence: json['idCompetence'] as String? ?? "",
      typeQuestion: json['typeQuestion'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  factory QuestionModel.fromJsonHive(Map<dynamic, dynamic> json) {
    return QuestionModel(
      id: json['id'] as String? ?? "",
      enunciated: json['enunciated'] as String? ?? "",
      feedback: json['feedback'] as String? ?? "",
      optionType: json['optionType'] as String? ?? "",
      optionA: json['optionA'] as String? ?? "",
      optionB: json['optionB'] as String? ?? "",
      optionC: json['optionC'] as String? ?? "",
      optionD: json['optionD'] as String? ?? "",
      correctAnswer: json['correctAnswer'] as int? ?? 0,
      idInfoQuestion: json['idInfoQuestion'] as String? ?? "",
      idCompetence: json['idCompetence'] as String? ?? "",
      typeQuestion: json['typeQuestion'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id,
      correctAnswer: correctAnswer,
      enunciated: enunciated,
      feedback: feedback,
      idCompetence: idCompetence,
      idInfoQuestion: idInfoQuestion!,
      optionA: optionA,
      optionB: optionB,
      optionC: optionC,
      optionD: optionD,
      optionType: optionType,
      typeQuestion: typeQuestion,
      dateUpdate: dateUpdate!,
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": id,
      "correctAnswer": correctAnswer,
      "enunciated": enunciated,
      "feedback": feedback,
      "idCompetence": idCompetence,
      "idInfoQuestion": idInfoQuestion,
      "optionA": optionA,
      "optionB": optionB,
      "optionC": optionC,
      "optionD": optionD,
      "optionType": optionType,
      "typeQuestion": typeQuestion,
      "dateUpdate": dateUpdate,
    };
  }

  static List<Map<dynamic, dynamic>> toJsonList(
    List<QuestionModel> competences,
  ) {
    return competences.map((competence) => competence.toJson()).toList();
  }

  static List<QuestionModel> toListModelHive(dynamic result) {
    List<QuestionModel> questionList = [];

    if (result is List) {
      for (var item in result) {
        QuestionModel question = QuestionModel.fromJsonHive(item);
        questionList.add(question);
      }
    }

    return questionList;
  }

  static List<QuestionModel> toListModelDio(dynamic result) {
    List<QuestionModel> questionList = [];

    if (result is List) {
      for (var item in result) {
        QuestionModel question = QuestionModel.fromJsonDio(item);
        questionList.add(question);
      }
    }

    return questionList;
  }
}
