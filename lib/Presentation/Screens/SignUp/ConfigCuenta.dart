import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/Simulacro/SimulacroService.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Domain/Entities/Simulacro/SimulacroEntity.dart';
import 'package:upcpro_app/Domain/Entities/User/UserEntity.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class CreatingCuenta extends StatefulWidget {
  final UserEntity user;
  const CreatingCuenta({super.key, required this.user});

  @override
  State<CreatingCuenta> createState() => _CreatingCuentaState();
}

class _CreatingCuentaState extends State<CreatingCuenta> {
  final storeUser = GetIt.instance<StoreUser>();
  final storeGeneric = GetIt.instance<StoreGeneric>();
  final simulacroService = GetIt.instance<SimulacroService>();
  bool? create;

  @override
  void initState() {
    super.initState();
    _iniciarCreacionCuenta();
  }

  Future<void> _iniciarCreacionCuenta() async {
    try {
      final resultado = await createCuenta();

      if (mounted) {
        setState(() {
          create = resultado;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          create = false;
        });
      }
    }
  }

  Future<bool> createCuenta() async {
    try {
      var resp = await storeUser.createUser(user: widget.user);
      if (resp) {
        Box boxSimulacro = await Hive.openBox('simulacro');

        var respSimulacro = await simulacroService.getSimulacroDio(
          storeUser.token,
        );

        if (!respSimulacro.isError!) {
          simulacroService.saveSimulacrosHive(
            SimulacroEntity.toListModel(respSimulacro.entities!),
            boxSimulacro,
          );

          storeGeneric.getSimulacros(boxSimulacro);
        }

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  create == null
                      ? Image.asset("assets/signup.png", width: 150)
                      : create == true
                      ? Image.asset("assets/exit.png", width: 150)
                      : Image.asset("assets/error.png", width: 150),
                  const SizedBox(height: 10),
                  Text(
                    create == null
                        ? "Creando tu cuenta..."
                        : create!
                        ? "Cuenta Creada Exitosamente"
                        : "Error al crear",
                    textAlign: TextAlign.center,
                    style: textStyle(
                      colortext: colorText(),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      create == null
                          ? "Esto no tardará mucho..."
                          : !create!
                          ? storeUser.message
                          : "",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),

                  if (create == null)
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeWidth: 4,
                    ),
                  const SizedBox(height: 20),

                  if (create == false)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          create = null;
                        });
                        _iniciarCreacionCuenta();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      child: Text("Reintentar"),
                    ),

                  const SizedBox(height: 20),

                  if (create == false)
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/login",
                          (route) => false,
                        );
                      },

                      child: Text(
                        "Iniciar Sesión",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),

                  if (create == true)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/home",
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      child: Text("Continuar"),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
