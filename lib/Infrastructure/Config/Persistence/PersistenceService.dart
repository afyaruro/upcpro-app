import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Services/Competence/CompetenceService.dart';
import 'package:upcpro_app/Application/Services/Faculty/FacultyService.dart';
import 'package:upcpro_app/Application/Services/InfoQuestion/InfoQuestionService.dart';
import 'package:upcpro_app/Application/Services/Program/ProgramService.dart';
import 'package:upcpro_app/Application/Services/Question/QuestionService.dart';
import 'package:upcpro_app/Application/Services/Simulacro/SimulacroService.dart';
import 'package:upcpro_app/Application/Services/User/SendCodeService.dart';
import 'package:upcpro_app/Application/Services/User/UserService.dart';

class PersistenceService {
  final di = GetIt.instance;

  Future<void> initService() async {
    di.registerLazySingleton(() => CompetenceService(repository: di()));
    di.registerLazySingleton(() => FacultyService(repository: di()));
    di.registerLazySingleton(() => ProgramService(repository: di()));
    di.registerLazySingleton(() => QuestionService(repository: di()));
    di.registerLazySingleton(() => InfoQuestionService(repository: di()));
    di.registerLazySingleton(() => UserService(repository: di()));
    di.registerLazySingleton(() => SendCodeService(sendMail: di()));
    di.registerLazySingleton(() => SimulacroService(repository: di()));
  }
}
