import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/Simulacro/SimulacroService.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Domain/Entities/Simulacro/SimulacroEntity.dart';
import 'package:upcpro_app/Presentation/Screens/Simulacro/widget/CardSimulacro.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class SimulacroScreen extends StatefulWidget {
  const SimulacroScreen({super.key});

  @override
  State<SimulacroScreen> createState() => _SimulacroScreenState();
}

class _SimulacroScreenState extends State<SimulacroScreen> {
  final storeUser = GetIt.instance<StoreUser>();
  final storeGeneric = GetIt.instance<StoreGeneric>();

  Widget buildSimulacro(BuildContext context) {
    return storeGeneric.simulacros.isNotEmpty
        ? Column(
          children:
              storeGeneric.simulacros
                  .map((simulacro) => CardSimulacro(simulacro: simulacro))
                  .toList(),
        )
        : const Text(
          "No hay simulacros disponibles",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: fullWidth(context),
                  height: fullHeight(context) * 0.5,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 41, 41, 41),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 120),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Simulacros",
                            style: textStyle(
                              colortext: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lime,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                storeGeneric.isRefreshingSimulacro
                                    ? Container(
                                      width: 48,
                                      height: 48,
                                      padding: const EdgeInsets.all(12),
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                    )
                                    : IconButton(
                                      onPressed: () async {
                                        storeGeneric.isRefreshingSimulacro =
                                            true;
                                        Box boxSimulacro = await Hive.openBox(
                                          'simulacro',
                                        );

                                        final simulacroService =
                                            GetIt.instance<SimulacroService>();

                                        var respSimulacroDio =
                                            await simulacroService
                                                .getSimulacroDio(
                                                  storeUser.token,
                                                );

                                        await simulacroService
                                            .saveSimulacrosHive(
                                              SimulacroEntity.toListModel(
                                                respSimulacroDio.entities!,
                                              ),
                                              boxSimulacro,
                                            );

                                        await storeGeneric.getSimulacros(
                                          boxSimulacro,
                                        );
                                        storeGeneric.isRefreshingSimulacro =
                                            false;
                                      },
                                      icon: const Icon(
                                        Icons.refresh_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    buildSimulacro(context),
                    const SizedBox(height: 100),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
