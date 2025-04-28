// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/CertificadoEntity.dart';
import 'package:upcpro_app/Domain/Entities/Simulacrum/SimulacroEntity.dart';
import 'package:upcpro_app/Domain/Entities/User/UserEntity.dart';
import 'package:upcpro_app/Presentation/Screens/BottomNav/BottomNav.dart';
import 'package:upcpro_app/Presentation/Screens/Question/QuestionScreen.dart';
import 'package:upcpro_app/Presentation/Screens/QuestionResult/QuestionResultScreen.dart';
import 'package:upcpro_app/Presentation/Screens/SetupPage/SetupPage.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/SignIn.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/ConfigCuenta.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp1.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp2.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp3.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp4.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp5.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp6.dart';
import 'package:upcpro_app/Presentation/Screens/Simulacro/GenerandoSimulacro.dart';
import 'package:upcpro_app/Presentation/Screens/Simulacro/SimulacroCompleteScreen.dart';
import 'package:upcpro_app/Presentation/Screens/Splash/splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String setup = '/setup';
  static const String home = '/home';
  static const String signup1 = '/signup1';
  static const String signup2 = '/signup2';
  static const String signup3 = '/signup3';
  static const String signup4 = '/signup4';
  static const String signup5 = '/signup5';
  static const String signup6 = '/signup6';
  static const String createCuenta = '/creating';
  static const String generandoSimulacro = '/generando-simulacro';
  static const String question = '/question';
  static const String simulacroComplete = '/simulacrum-complete';
  static const String exitResult = '/result';
  static const String result = '/response-question';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignIn(),
    splash: (context) => const Splash(),
    setup: (context) => const SetupPage(),
    home: (context) => const BottomMenu(),
    signup1: (context) => const SignUp1(),
    signup2: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final code = args['code'] as String;
      final correo = args['correo'] as String;
      return SignUp2(code: code, correo: correo);
    },

    signup3: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final correo = args['correo'] as String;
      return SignUp3(correo: correo);
    },

    signup4: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final correo = args['correo'] as String;
      final nombres = args['nombres'] as String;
      final apellidos = args['apellidos'] as String;
      final tipoIdentificacion = args['tipoIdentificacion'] as String;
      final identificacion = args['identificacion'] as String;
      final genero = args['genero'] as String;

      return SignUp4(
        correo: correo,
        nombres: nombres,
        apellidos: apellidos,
        tipoIdentificacion: tipoIdentificacion,
        identificacion: identificacion,
        genero: genero,
      );
    },

    signup5: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final correo = args['correo'] as String;
      final nombres = args['nombres'] as String;
      final apellidos = args['apellidos'] as String;
      final tipoIdentificacion = args['tipoIdentificacion'] as String;
      final identificacion = args['identificacion'] as String;
      final genero = args['genero'] as String;
      final programId = args['programId'] as String;
      return SignUp5(
        correo: correo,
        nombres: nombres,
        apellidos: apellidos,
        tipoIdentificacion: tipoIdentificacion,
        identificacion: identificacion,
        genero: genero,
        programId: programId,
      );
    },

    signup6: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final correo = args['correo'] as String;
      final nombres = args['nombres'] as String;
      final apellidos = args['apellidos'] as String;
      final tipoIdentificacion = args['tipoIdentificacion'] as String;
      final identificacion = args['identificacion'] as String;
      final genero = args['genero'] as String;
      final programId = args['programId'] as String;
      final image = args['image'] as String;

      return SignUp6(
        correo: correo,
        nombres: nombres,
        apellidos: apellidos,
        tipoIdentificacion: tipoIdentificacion,
        identificacion: identificacion,
        genero: genero,
        programId: programId,
        image: image,
      );
    },

    createCuenta: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final user = args['user'] as UserEntity;
      return CreatingCuenta(user: user);
    },

    generandoSimulacro: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final simulacro = args['simulacro'] as SimulacroEntity;
      return GenerandoSimulacro(simulacro: simulacro);
    },

    question: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final position = args['position'] as int;
      return QuestionScreen(position: position);
    },

    simulacroComplete: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final result = args['result'] as CertificadoEntity;
      return SimulacroCompleteScreen(result: result);
    },

    exitResult: (context) => const BottomMenu(index: 2),

    result: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final result = args['result'] as CertificadoEntity;
      final position = args['position'] as int;
      return QuestionResultScreen(result: result, position: position);
    },
  };
}
