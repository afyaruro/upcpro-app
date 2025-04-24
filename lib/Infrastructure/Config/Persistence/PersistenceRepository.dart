import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Domain/Ports/Certificado/ICertificadoRepository.dart';
import 'package:upcpro_app/Domain/Ports/Competence/ICompetenceRepository.dart';
import 'package:upcpro_app/Domain/Ports/Faculty/IFacultyRepository.dart';
import 'package:upcpro_app/Domain/Ports/InfoQuestion/IInfoQuestionRepository.dart';
import 'package:upcpro_app/Domain/Ports/Program/IProgramRepository.dart';
import 'package:upcpro_app/Domain/Ports/Question/IQuestionRepository.dart';
import 'package:upcpro_app/Domain/Ports/Simulacro/ISimulacroRepository.dart';
import 'package:upcpro_app/Domain/Ports/User/IUserRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/Certificado/CertificadoRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/Competence/CompetenceRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/Faculty/FacultyRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/InfoQuestion/InfoQuestionRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/Program/ProgramRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/Question/QuestionRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/Simulacro/SimulacroRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/user/UserRepository.dart';
import 'package:upcpro_app/Infrastructure/Config/smtp/sendMailService.dart';

class PersistenceRepository {
  final di = GetIt.instance;

  Future<void> initRepository() async {
    Dio dio = Dio();

    di.registerLazySingleton<ICompetenceRepository>(() => CompetenceRepository(dio: dio));
    di.registerLazySingleton<IFacultyRepository>(() => FacultyRepository(dio: dio));
    di.registerLazySingleton<IProgramRepository>(() => ProgramRepository(dio: dio));
    di.registerLazySingleton<IQuestionRepository>(() => QuestionRepository(dio: dio));
    di.registerLazySingleton<IInfoQuestionRepository>(() => InfoQuestionRepository(dio: dio));
    di.registerLazySingleton<IUserRepository>(() => UserRepository(dio: dio));
    di.registerLazySingleton(() => SendEmailSmtp());
    di.registerLazySingleton<ISimulacroRepository>(() => SimulacroRepository(dio: dio));
    di.registerLazySingleton<ICertificadoRepository>(() => CertificadoRepository(dio: dio));



  
  }
}
