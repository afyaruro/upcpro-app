import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/BuildTextField.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomLoadingDialog.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/CustomStatusDialog.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp1.dart';
import 'package:upcpro_app/Presentation/Stores/User/userStore.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storeUser = GetIt.instance<StoreUser>();

  late ReactionDisposer loadingDisposer;

  @override
  void initState() {
    super.initState();

    loadingDisposer = reaction<bool>((_) => storeUser.isLoading, (isLoading) {
      if (isLoading) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const CustomLoadingDialog(),
        );
      } else {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  void dispose() {
    loadingDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 8, 8, 8),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset("assets/fondo_login.jpg", fit: BoxFit.cover),
            ),

            Container(color: const Color.fromARGB(120, 8, 8, 8)),

            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/image.png",
                        width: 120,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Bienvenido",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.lime,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Accede a tu cuenta para continuar",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      buildTextFieldSingIn(
                        controller: emailController,
                        hintText: "Correo electrónico",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 20),
                      buildTextFieldSingIn(
                        controller: passwordController,
                        hintText: "Contraseña",
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "¿Olvidaste tu contraseña?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            var resp = await storeUser.login(
                              mail: emailController.text,
                              password: passwordController.text,
                            );

                            if (resp) {
                              //Iniciar secion y aca debe configurar los niveles, simulacros,
                              // preguntas, preguntas cuestion. todo eso descargarlo de la base
                              // de datos para luego procesarlos.
                            } else {
                              showDialog(
                                context: context,
                                builder:
                                    (_) => CustomStatusDialog(
                                      title: 'Error',
                                      message: storeUser.message,
                                      icon: Icons.error_outline,
                                      iconColor: Colors.red,
                                    ),
                              );
                            }

                            
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 5,
                          ),
                          child: const Text(
                            "Iniciar sesión",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 34, 34, 34),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "¿No tienes una cuenta?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp1(),
                                ),
                              );
                            },
                            child: const Text(
                              "Regístrate",
                              style: TextStyle(
                                color: Colors.lime,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
