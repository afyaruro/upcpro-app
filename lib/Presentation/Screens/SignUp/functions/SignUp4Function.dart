import 'package:flutter/material.dart';
import 'package:upcpro_app/Domain/Entities/Faculty/FacultyEntity.dart';
import 'package:upcpro_app/Domain/Entities/Program/ProgramEntity.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomStatusDialog.dart';

class SignUp4Function {
  static void validarProgram({
    required String nombres,
    required String apellidos,
    required String tipoDocumento,
    required String numeroDocumento,
    required String correo,
    required String genero,
    required FacultyEntity faculty,
    required ProgramEntity? program,
    required BuildContext context,
  }) {
    if (faculty.name == "Selecciona una facultad") {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Por favor selecciona una facultad y un programa',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (program == null || program.name == "Selecciona un programa") {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Por favor selecciona un programa',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      '/signup5',
      arguments: {
        'correo': correo,
        'nombres': nombres,
        'apellidos': apellidos,
        'tipoIdentificacion': tipoDocumento,
        'identificacion': numeroDocumento,
        'genero': genero,
        'programId': program.id,
      },
    );
  }
}
