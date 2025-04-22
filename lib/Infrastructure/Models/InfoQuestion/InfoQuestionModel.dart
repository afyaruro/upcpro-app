import 'package:upcpro_app/Domain/Entities/InfoQuestion/InfoQuestionEntity.dart';

class InfoQuestionModel {
  final String id;
  final String context;
  final String image;
  final DateTime dateUpdate;

  InfoQuestionModel({
    required this.id,
    required this.context,
    required this.image,
    required this.dateUpdate,
  });

  factory InfoQuestionModel.fromJsonDio(Map<dynamic, dynamic> json) {
    return InfoQuestionModel(
      id: json['id'] as String? ?? "",
      context: json['context'] as String? ?? "",
      image: json['image'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  factory InfoQuestionModel.fromJsonHive(Map<dynamic, dynamic> json) {
    return InfoQuestionModel(
      id: json['id'] as String? ?? "",
      context: json['context'] as String? ?? "",
      image: json['image'] as String? ?? "",
      dateUpdate:
          json['dateUpdate'] is String
              ? DateTime.parse(json['dateUpdate'])
              : json['dateUpdate'] as DateTime,
    );
  }

  InfoQuestionEntity toEntity() {
    return InfoQuestionEntity(
      id: id,
      context: context,
      image: image,
      dateUpdate: dateUpdate,
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": id,
      "context": context,
      "image": image,
      "dateUpdate": dateUpdate,
    };
  }

  static List<Map<dynamic, dynamic>> toJsonList(
    List<InfoQuestionModel> competences,
  ) {
    return competences.map((competence) => competence.toJson()).toList();
  }

  static List<InfoQuestionModel> toListModelHive(dynamic result) {
    List<InfoQuestionModel> questionList = [];

    if (result is List) {
      for (var item in result) {
        InfoQuestionModel question = InfoQuestionModel.fromJsonHive(item);
        questionList.add(question);
      }
    }

    return questionList;
  }

  static List<InfoQuestionModel> toListModelDio(dynamic result) {
    List<InfoQuestionModel> questionList = [];

    if (result is List) {
      for (var item in result) {
        InfoQuestionModel question = InfoQuestionModel.fromJsonDio(item);
        questionList.add(question);
      }
    }

    return questionList;
  }
}
