import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Services/User/SendCodeService.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomStatusDialog.dart';

class SignUp2Function {
  static Future<String?> reenviarCodigo(
    String correo,
    BuildContext context,
    Function function,
  ) async {
    function();
    final sendMail = GetIt.instance<SendCodeService>();
    String code = sendMail.generateCodeVerification();
    if (await sendMail.sendCodeVerification(correo, code)) {
      return code;
    }

    return null;
  }

  static void validarCodigo({
    required String codigoEnviado,
    required String codigo,
    required BuildContext context,
    required String correo,
  }) {
    if (codigoEnviado == codigo) {
      Navigator.pushNamed(context, '/signup3', arguments: {'correo': correo});
      return;
    }

    showDialog(
      context: context,
      builder:
          (_) => CustomStatusDialog(
            title: 'Codigo Invalido',
            message: 'El codigo enviado no coincide',
            icon: Icons.error_outline,
            iconColor: Colors.red,
          ),
    );

    return;
  }
}
