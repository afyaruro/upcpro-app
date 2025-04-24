import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Services/User/UserService.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final List<String> _messages = [
    "Verificando tu cuenta...",
    "Cargando tus preferencias...",
    "Sincronizando información...",
    "Configurando notificaciones...",
    "¡Listo! Todo está preparado.",
  ];

  int _currentIndex = 0;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _startSetupProcess();
  }

  void _startSetupProcess() async {
    for (int i = 0; i < _messages.length; i++) {
      //Iniciar secion y aca debe configurar los niveles, simulacros,
      // preguntas, preguntas cuestion. todo eso descargarlo de la base
      // de datos para luego procesarlos.
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      setState(() {
        _currentIndex = i;
      });
    }

    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _finished = true;
      });

      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child:
              !_finished
                  ? Column(
                    key: const ValueKey("setup"),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 20),
                      Text(
                        _messages[_currentIndex],
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                  : const Column(
                    key: ValueKey("done"),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Configuración completa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
