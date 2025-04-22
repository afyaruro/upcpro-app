import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/functions/SignUp6Function.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/BuildTextFieldSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/CustomBtnSignUp.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

// ignore: must_be_immutable
class SignUp6 extends StatefulWidget {
  final String correo;
  final String nombres;
  final String apellidos;
  final String tipoIdentificacion;
  final String identificacion;
  final String genero;
  final String programId;
  final String image;

  SignUp6({
    super.key,
    required this.correo,
    required this.nombres,
    required this.apellidos,
    required this.tipoIdentificacion,
    required this.identificacion,
    required this.genero,
    required this.programId,
    required this.image,
  });

  @override
  State<SignUp6> createState() => _SignUp6State();
}

class _SignUp6State extends State<SignUp6> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
    final storeUser = GetIt.instance<StoreUser>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confPasswordController.dispose();
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Ahora vamos a configurar la contraseña de tu cuenta.",
                        style: textStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          colortext: colorText(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: BuildTextFieldSignUp(
                        isPassword: true,
                        hintText: "Nueva Contraseña",
                        icon: Icons.password_outlined,
                        controller: passwordController,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: BuildTextFieldSignUp(
                        isPassword: true,
                        hintText: "Confirmar Contraseña",
                        icon: Icons.password_outlined,
                        controller: confPasswordController,
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            CustomBtnSignUp(
              function: () {
                SignUp6Function.validarPassword(
                  nombres: widget.nombres,
                  apellidos: widget.apellidos,
                  tipoDocumento: widget.tipoIdentificacion,
                  numeroDocumento: widget.identificacion,
                  correo: widget.correo,
                  genero: widget.genero,
                  program: widget.programId,
                  image: widget.image,
                  password: passwordController.text.trim(),
                  confPassword: confPasswordController.text.trim(),
                  context: context,
                  storeUser: storeUser
                );
              },
              name: "Registrarme",
            ),
          ],
        ),
      ),
    );
  }
}
