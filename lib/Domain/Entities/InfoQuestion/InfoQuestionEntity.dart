import 'package:upcpro_app/Infrastructure/Models/InfoQuestion/InfoQuestionModel.dart';

class InfoQuestionEntity {
  final String id;
  final String context;
  final String image;
  final DateTime dateUpdate;

  InfoQuestionEntity({
    required this.id,
    required this.context,
    required this.image,
    required this.dateUpdate,
  });

  InfoQuestionModel toModel() {
    return InfoQuestionModel(
      id: id,
      context: context,
      image: image,
      dateUpdate: dateUpdate,
    );
  }

  static List<InfoQuestionEntity> toListEntity(List<InfoQuestionModel> competences) {
    return competences.map((competence) => competence.toEntity()).toList();
  }

  static List<InfoQuestionModel> toListModel(List<InfoQuestionEntity> competences) {
    return competences.map((competence) => competence.toModel()).toList();
  }
}
