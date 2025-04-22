import 'package:flutter/material.dart';
import 'package:upcpro_app/Infrastructure/Config/Routes/Routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lime,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lime,
        ).copyWith(secondary: Colors.white),
      ),
    );
  }
}
