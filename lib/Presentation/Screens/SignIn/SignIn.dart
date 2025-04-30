import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Presentation/ComponentBase/WidgetBase.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/ForgotPassword.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/function/SignInFunction.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/widgets/BuildTextField.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/SignUp1.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storeUser = GetIt.instance<StoreUser>();
  
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 8, 8, 8),
      body: WidgetBase(
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
                      StatefulBuilder(
                        builder: (context, setState) {
                          return TextField(
                            controller: passwordController,
                            obscureText: !_isPasswordVisible, 
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Contraseña",
                              hintStyle: const TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: const Color.fromARGB(90, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
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
                            SignInFunction.Login(
                              context: context,
                              correo: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              userStore: storeUser,
                            );
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
