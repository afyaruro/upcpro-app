import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upcpro_app/Infrastructure/Config/Persistence/PersistenceRepository.dart';
import 'package:upcpro_app/Infrastructure/Config/MyApp/MyApp.dart';
import 'package:upcpro_app/Infrastructure/Config/Persistence/PersistenceService.dart';
import 'package:upcpro_app/Infrastructure/Config/Persistence/PersistenceStore.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();

  PersistenceRepository repository = PersistenceRepository();
  await repository.initRepository();

  PersistenceService service = PersistenceService();
  await service.initService();

  PersistenceStore store = PersistenceStore();
  await store.initStore();
  
  runApp(
    const MyApp(),
  );
}

