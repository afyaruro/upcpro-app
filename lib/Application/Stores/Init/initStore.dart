import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:upcpro_app/Application/Services/Competence/CompetenceService.dart';
import 'package:upcpro_app/Application/Services/Faculty/FacultyService.dart';
import 'package:upcpro_app/Application/Services/InfoQuestion/InfoQuestionService.dart';
import 'package:upcpro_app/Application/Services/Program/ProgramService.dart';
import 'package:upcpro_app/Application/Services/Question/QuestionService.dart';
import 'package:upcpro_app/Domain/Entities/Competence/CompetenceEntity.dart';
import 'package:upcpro_app/Domain/Entities/Faculty/FacultyEntity.dart';
import 'package:upcpro_app/Domain/Entities/InfoQuestion/InfoQuestionEntity.dart';
import 'package:upcpro_app/Domain/Entities/Program/ProgramEntity.dart';
import 'package:upcpro_app/Domain/Entities/Question/QuestionEntity.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';

part 'initStore.g.dart';

class StoreInit = _StoreInit with _$StoreInit;

abstract class _StoreInit with Store {
  @observable
  bool isLoadingInfoQuestion = false;

  @observable
  bool isLoadingQuestion = false;

  @observable
  bool isLoadingFaculty = false;

  @observable
  bool isLoadingCompetence = false;

  @observable
  bool isLoadingProgram = false;

  @observable
  List<String> errors = [];

  @action
  Future Config({required Box boxConfig, required Box boxFaculty, required Box boxCompetence, required Box boxProgram, required Box boxQuestion, required Box boxInfoquestion}) async {
    await boxConfig.put('isConfigured', false);

    bool competenceSave = await configCompetence(boxCompetence);
    bool facultySave = await configFaculty(boxFaculty);
    bool programSave = await configProgram(boxProgram);
    bool questionSave = await configQuestion(boxQuestion);
    bool infoQuestionSave = await configInfoQuestions(boxInfoquestion);

    if (!competenceSave ||
        !facultySave ||
        !programSave ||
        !questionSave ||
        !infoQuestionSave) {
      return false;
    }

    await boxConfig.put('isConfigured', true);
    await boxConfig.put('lastSyncDate', DateTime.now());
  }

  @action
  Future<bool> configCompetence(Box box) async {
    isLoadingCompetence = true;
    final serviceCompetence = GetIt.instance<CompetenceService>();
    ResponseEntity<CompetenceEntity> respCompetenceDio =
        await serviceCompetence.getCompetenceDio();
    if (respCompetenceDio.isError!) {
      isLoadingCompetence = false;
      errors.add("No hemos podido cargar las competencias");
      return false;
    }
    isLoadingCompetence = false;
    return await serviceCompetence.saveCompetencesHive(
      CompetenceEntity.toListModel(respCompetenceDio.entities!),
      box,
    );
  }

  @action
  Future<bool> configFaculty(Box box) async {
    isLoadingFaculty = true;
    final serviceFaculty = GetIt.instance<FacultyService>();
    ResponseEntity<FacultyEntity> respFacultyDio =
        await serviceFaculty.getFacultyDio();
    if (respFacultyDio.isError!) {
      isLoadingFaculty = false;
      errors.add("No hemos podido cargar las facultades");
      return false;
    }
    isLoadingFaculty = false;
    return await serviceFaculty.saveFacultiesHive(
      FacultyEntity.toListModel(respFacultyDio.entities!),
      box,
    );
  }

  @action
  Future<bool> configProgram(Box box) async {
    isLoadingProgram = true;
    final serviceProgram = GetIt.instance<ProgramService>();
    ResponseEntity<ProgramEntity> respProgramDio =
        await serviceProgram.getProgramDio();
    if (respProgramDio.isError!) {
      isLoadingProgram = false;
      errors.add("No hemos podido cargar los programas");
      return false;
    }
    isLoadingProgram = false;
    return await serviceProgram.saveProgramsHive(
      ProgramEntity.toListModel(respProgramDio.entities!),
      box,
    );
  }

  @action
  Future<bool> configQuestion(Box box) async {
    isLoadingQuestion = true;
    final serviceQuestion = GetIt.instance<QuestionService>();
    List<QuestionEntity> listQuestion = [];
    int currentPage = 1;
    bool hasMorePages = true;
    while (hasMorePages) {
      ResponseEntity<QuestionEntity> respQuestionDio = await serviceQuestion
          .getQuestionDio(currentPage);

      if (respQuestionDio.isError!) {
        isLoadingQuestion = false;
        errors.add("Error al cargar las preguntas");
        return false;
      } else {
        listQuestion.addAll(respQuestionDio.entities!);
        if (respQuestionDio.pages! > currentPage) {
          currentPage++;
        } else {
          hasMorePages = false;
        }
      }
    }
    isLoadingQuestion = false;
    return await serviceQuestion.saveQuestionHive(
      QuestionEntity.toListModel(listQuestion),
      box,
    );
  }

  @action
  Future<bool> configInfoQuestions(Box box) async {
    isLoadingInfoQuestion = true;
    final serviceInfoQuestion = GetIt.instance<InfoQuestionService>();
    List<InfoQuestionEntity> listInfoQuestion = [];
    int currentPage = 1;
    bool hasMorePages = true;
    while (hasMorePages) {
      ResponseEntity<InfoQuestionEntity> respInfoQuestionDio =
          await serviceInfoQuestion.getInfoQuestionDio(currentPage);

      if (respInfoQuestionDio.isError!) {
        isLoadingInfoQuestion = false;
        errors.add("Error al cargar el contexto de las preguntas");
        return false;
      } else {
        listInfoQuestion.addAll(respInfoQuestionDio.entities!);
        if (respInfoQuestionDio.pages! > currentPage) {
          currentPage++;
        } else {
          hasMorePages = false;
        }
      }
    }
    isLoadingInfoQuestion = false;
    return await serviceInfoQuestion.saveInfoQuestionHive(
      InfoQuestionEntity.toListModel(listInfoQuestion),
      box,
    );
  }
}
