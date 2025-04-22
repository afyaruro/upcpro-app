import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomStatusDialog.dart';

class SignUp3Function {
  static void validarInfo({
    required String nombres,
    required String apellidos,
    required String tipoDocumento,
    required String numeroDocumento,
    required String correo,
    required String genero,

    required BuildContext context,
  }) {
    if (nombres.isEmpty) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Los nombres son obligatorio',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (nombres.length < 3) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Los nombres deben tener almenos 3 caracteres',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );

      return;
    }

    if (apellidos.isEmpty) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Los apellidos son obligatorio',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (apellidos.length < 3) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Los apellidos deben tener almenos 3 caracteres',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );

      return;
    }

    if (tipoDocumento == "Tipo de identificación") {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Por favor selecciona un tipo de identificación',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (numeroDocumento.isEmpty) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'El número de identificación es obligatorio',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (numeroDocumento.length < 5) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message:
                  'El número de identificación debe tener almenos 5 caracteres',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );

      return;
    }

    if (genero == "Género") {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Por favor selecciona un género',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      '/signup4',
      arguments: {
        'correo': correo,
        'nombres': nombres,
        'apellidos': apellidos,
        'tipoIdentificacion': tipoDocumento,
        'identificacion': numeroDocumento,
        'genero': genero,
      },
    );
  }
}
