import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/Simulacro/SimulacroService.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Application/Stores/Init/initStore.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Domain/Entities/Simulacrum/SimulacroEntity.dart';
import 'package:upcpro_app/Infrastructure/Config/Routes/Routes.dart';

class InitService {
  BuildContext context;

  InitService({required this.context});

  Future<void> Init({
    required Box boxConfig,
    required Box boxProgram,
    required Box boxFaculty,
    required Box boxQuestion,
    required Box boxInfoquestion,
    required Box boxCompetence,
    required Box boxSimulacro,
  }) async {
    //al inicio toca validar la conexion a internet

    var isConfigure = await boxConfig.get('isConfigured');
    final storeInit = GetIt.instance<StoreInit>();

    if (isConfigure == null || isConfigure == false) {
      await storeInit.Config(
        boxCompetence: boxCompetence,
        boxConfig: boxConfig,
        boxFaculty: boxFaculty,
        boxInfoquestion: boxInfoquestion,
        boxProgram: boxProgram,
        boxQuestion: boxQuestion,
      );
    } else {
      print(
        "Se supone que ya se configuro aca debe sincronizar la informacion en segundo plano",
      );
    }

    final storeUser = GetIt.instance<StoreUser>();
    await storeUser.getUser();

    final storeGeneric = GetIt.instance<StoreGeneric>();
    await storeGeneric.getFaculties(boxFaculty);
    await storeGeneric.getPrograms(boxProgram);

    if (storeUser.token != "" && storeUser.user != null) {
      await storeGeneric.getCompetence(boxCompetence);

      final simulacroService = GetIt.instance<SimulacroService>();

      boxSimulacro.clear();

      var respSimulacroDio = await simulacroService.getSimulacroDio(
        storeUser.token,
      );
      await simulacroService.saveSimulacrosHive(
        SimulacroEntity.toListModel(respSimulacroDio.entities!),
        boxSimulacro,
      );
      await storeGeneric.getSimulacros(boxSimulacro);

      // aca se cargan certificados, ranking etc. aca el resto  pero esto es al loguearse no aca al igual al registrase

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
      return;
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
      return;
    }
  }
}
