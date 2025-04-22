import 'dart:async';
import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/ComponentBase/WidgetBase.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/functions/SignUp2Function.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/BuildTextFieldSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/CustomBtnSignUp.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

// ignore: must_be_immutable
class SignUp2 extends StatefulWidget {
  late String code;
  final String correo;
  SignUp2({super.key, required this.code, required this.correo});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final TextEditingController codeController = TextEditingController();
  Timer? _timer;
  int _start = 60;
  String? _code;

  void _startTimer() {
    setState(() {
      _start = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resendCode() async {
    String? resp = await SignUp2Function.reenviarCodigo(
      widget.correo,
      context,
      () => _startTimer(),
    );
    if (resp != null) {
      setState(() {
        _code = resp;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _code = widget.code;
    _startTimer();
  }

  @override
  void dispose() {
    codeController.dispose();
    _timer?.cancel();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Hemos enviado un código a tu correo.",
                          style: textStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            colortext: colorText(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: BuildTextFieldSignUp(
                          hintText: "Código de verificación",
                          icon: Icons.comment_outlined,
                          controller: codeController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: _start == 0 ? _resendCode : null,
                          child: Text(
                            _start == 0
                                ? "Reenviar código"
                                : "Reenviar código en $_start s",
                            style: const TextStyle(
                              color: Colors.lime,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),

              CustomBtnSignUp(
                function: () {
                  SignUp2Function.validarCodigo(
                    codigoEnviado: _code!,
                    codigo: codeController.text.trim(),
                    context: context,
                    correo: widget.correo,
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
