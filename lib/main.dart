import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Screens/Splash/splash.dart';

void main() async {
  
  // await Hive.initFlutter();
  // await Hive.openBox('preguntas');
  // await Hive.openBox('competencia-seleccionada');
  // await Hive.openBox('nivel-actual');
  // await Hive.openBox('puntajes');
  // await Hive.openBox('usuario');


  // Get.put(ControllerNiveles());
  
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 104, 139, 108),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: const Color.fromARGB(255, 181, 190, 169), // Color de acento
        ),
      ),

      
    );
  }
}