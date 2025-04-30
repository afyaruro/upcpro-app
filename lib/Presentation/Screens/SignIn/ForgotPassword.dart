import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/ComponentBase/WidgetBase.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/BuildTextFieldSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/CustomBtnSignUp.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
            child: Icon(Icons.lock_outline, size: 40, color: Colors.black),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "¿Olvidaste tu contraseña?",
                          style: textStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            colortext: colorText(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Ingresa tu correo institucional y te enviaremos un código para restablecerla.",
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
                function: () {
                  // Aquí va la lógica para enviar el código
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Código enviado (mock).")),
                  );
                },
                name: "Enviar código",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
