import 'package:flutter/material.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Domain/Entities/User/UserEntity.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomStatusDialog.dart';

class SignUp6Function {
  static Future<void> validarPassword({
    required String nombres,
    required String apellidos,
    required String tipoDocumento,
    required String numeroDocumento,
    required String correo,
    required String genero,
    required String program,
    required String image,
    required String password,
    required String confPassword,
    required BuildContext context,
    required StoreUser storeUser,
  }) async {
    if (password.isEmpty) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'La contraseña es obligatoria',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (password.length < 8) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'La contraseña debe tener almenos 8 caracteres',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message:
                  'La contraseña debe contener al menos una letra minúscula',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message:
                  'La contraseña debe contener al menos una letra mayúscula',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (!password.contains(RegExp(r'\d'))) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'La contraseña debe contener al menos un número',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    if (password != confPassword) {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validar',
              message: 'Las contraseñas no coinciden',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    UserEntity user = UserEntity(
      id: "",
      mail: correo,
      image: image,
      firstName: nombres,
      lastName: apellidos,
      identification: numeroDocumento,
      typeIdentification: tipoDocumento,
      gender: genero,
      typeUser: "",
      program: program,
      password: password,
    );

    Navigator.pushNamed(context, '/creating', arguments: {'user': user});
  }
}
