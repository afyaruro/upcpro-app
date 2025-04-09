import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Screens/Splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lime,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lime,
        ).copyWith(
          secondary:  Colors.white, 
        ),
      ),

      
    );
  }
}