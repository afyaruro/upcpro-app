import 'package:flutter/material.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomLoadingDialog.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomStatusDialog.dart';

class SignInFunction {
  static void Login({
    required BuildContext context,
    required String correo,
    required String password,
    required StoreUser userStore,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const CustomLoadingDialog(),
    );

    FocusScope.of(context).unfocus();

    if (correo.isEmpty || password.isEmpty) {
      Navigator.of(context).pop();

      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Validación',
              message: "Por favor, completa todos los campos",
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
      return;
    }

    var resp = await userStore.login(mail: correo, password: password);

    Navigator.of(context).pop();

    if (resp) {
      Navigator.pushNamedAndRemoveUntil(context, "/setup", (route) => false);
    } else {
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Error',
              message: userStore.message,
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );
    }
  }
}
