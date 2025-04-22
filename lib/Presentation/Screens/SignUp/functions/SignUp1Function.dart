import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Services/User/SendCodeService.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomLoadingDialog.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomStatusDialog.dart';

class SignUp1Function {
  static bool validateMail(String correo, BuildContext context) {
    if (correo.isEmpty) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Error',
              message: 'Por favor ingresa un correo electrónico',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );

      return false;
    }

    bool isValidEmail = RegExp(
      r'^[a-zA-Z0-9._%+-]+@unicesar\.edu\.co$',
      caseSensitive: false,
    ).hasMatch(correo);

    if (!isValidEmail) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder:
            (_) => CustomStatusDialog(
              title: 'Error',
              message: 'Debes usar un correo institucional (@unicesar.edu.co)',
              icon: Icons.error_outline,
              iconColor: Colors.red,
            ),
      );

      return false;
    }

    return true;
  }

  static Future<void> sendCode({
    required String mail,
    required BuildContext context,
  }) async {
    FocusScope.of(context).unfocus();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const CustomLoadingDialog(),
    );

    if (!validateMail(mail, context)) {
      return null;
    }

    final sendMail = GetIt.instance<SendCodeService>();
    String code = sendMail.generateCodeVerification();
    if (await sendMail.sendCodeVerification(mail, code)) {
      Navigator.of(context).pop();

      Navigator.pushNamed(
        context,
        '/signup2',
        arguments: {'code': code, 'correo': mail},
      );

      return;
    }

    Navigator.of(context).pop();

    showDialog(
      context: context,
      builder:
          (_) => CustomStatusDialog(
            title: 'Error',
            message: 'Error al enviar el correo',
            icon: Icons.error_outline,
            iconColor: Colors.red,
          ),
    );
  }
}
