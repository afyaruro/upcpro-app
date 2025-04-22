import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/ComponentBase/WidgetBase.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/functions/SignUp1Function.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/BuildTextFieldSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/CustomBtnSignUp.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  final TextEditingController controllerCorreo = TextEditingController();

  @override
  void dispose() {
    controllerCorreo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/upcpro.png', height: 80, width: 80),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: WidgetBase(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Empecemos a crear tu cuenta",

                          style: textStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            colortext: colorText(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Enviaremos un código a tu correo para verificar que este correo te pertenece",
                          style: textStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            colortext: colorText(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: BuildTextFieldSignUp(
                          hintText: "Correo",
                          icon: Icons.email_outlined,
                          controller: controllerCorreo,
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
              CustomBtnSignUp(
                function: () async {
                  await SignUp1Function.sendCode(
                    mail: controllerCorreo.text.trim(),
                    context: context,
                  );
                },
                name: "Siguiente",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
