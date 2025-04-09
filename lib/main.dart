import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upcpro_app/Config/Dependency/StartDependecy.dart';
import 'package:upcpro_app/Config/MyApp/MyApp.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  StartDependency startDependency = StartDependency();
  await Hive.initFlutter();
  await startDependency.init();
  
  runApp(
    const MyApp(),
  );
}

