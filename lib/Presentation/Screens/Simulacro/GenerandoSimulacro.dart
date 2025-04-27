import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/Certificado/CertificadoService.dart';
import 'package:upcpro_app/Application/Services/Simulacro/SimulacroService.dart';
import 'package:upcpro_app/Application/Stores/Certificado/certificadoStore.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/CertificadoEntity.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/RespuestaPreguntaEntity.dart';
import 'package:upcpro_app/Domain/Entities/Simulacrum/SimulacroEntity.dart';
import 'package:upcpro_app/Infrastructure/Config/Routes/Routes.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class GenerandoSimulacro extends StatefulWidget {
  const GenerandoSimulacro({super.key, required this.simulacro});

  final SimulacroEntity simulacro;

  @override
  State<GenerandoSimulacro> createState() => _GenerandoSimulacroState();
}

class _GenerandoSimulacroState extends State<GenerandoSimulacro> {
  int numCiudadanas = 0;
  int numIngles = 0;
  int numlectura = 0;
  int numRazonamiento = 0;

  List<RespuestaPreguntaEntity> list = [];

  final simulacroService = GetIt.instance<SimulacroService>();
  final certificadoService = GetIt.instance<CertificadoService>();

  final userStore = GetIt.instance<StoreUser>();
  final genericStore = GetIt.instance<StoreGeneric>();
  final certificadoStore = GetIt.instance<StoreCertificado>();

  contPreguntas() {
    for (var competence in genericStore.competences) {
      if (widget.simulacro.type == competence.id) {
        if (competence.name == "LECTURA CRÍTICA") {
          numlectura += 1;
          return;
        } else if (competence.name == "COMPETENCIAS CIUDADANAS") {
          numCiudadanas += 1;
          return;
        } else if (competence.name == "INGLÉS") {
          numIngles += 1;
          return;
        } else if (competence.name == "RAZONAMIENTO CUANTITATIVO") {
          numRazonamiento += 1;
          return;
        }
      }
    }
  }

  generarSimulacro() async {
    certificadoStore.isLoading = true;
    certificadoStore.generated = false;
    Box boxQuestion = await Hive.openBox('question');
    Box boxInfoQuestion = await Hive.openBox('infoQuestion');
    Box boxSimulacroActive = await Hive.openBox('simulacroActivo');

    var resp = await simulacroService.generarSimulacroDio(
      id: widget.simulacro.id,
      token: userStore.token,
      boxQuestion: boxQuestion,
      boxInfoQuestion: boxInfoQuestion,
    );

    if (!resp.isError!) {
      for (var question in resp.entities!) {
        list.add(
          RespuestaPreguntaEntity(
            infoQuestion: question.infoQuestion,
            id: question.id,
            enunciated: question.enunciated,
            feedback: question.feedback,
            optionType: question.optionType,
            optionA: question.optionA,
            optionB: question.optionB,
            optionC: question.optionC,
            optionD: question.optionD,
            correctAnswer: question.correctAnswer,
            typeQuestion: question.typeQuestion,
            idInfoQuestion: question.idInfoQuestion,
            idCompetence: question.idCompetence,
            dateUpdate: question.dateUpdate,
            isResponse: false,
            selectedOption: 0,
          ),
        );

        contPreguntas();
      }

      if (widget.simulacro.type == "ALL") {
        numCiudadanas = (list.length / 4).toInt();
        numIngles = (list.length / 4).toInt();
        numRazonamiento = (list.length / 4).toInt();
        numlectura = (list.length / 4).toInt();
      }

      final simulacroActivo = CertificadoEntity(
        simulacro: widget.simulacro,
        fecha: DateTime.now(),
        totalCiudadanas: numCiudadanas,
        totalIngles: numIngles,
        totalRazonamiento: numRazonamiento,
        totalLectura: numlectura,
        listRespuesta: list,
      );

      await certificadoService.saveCertificadosHive(
        simulacroActivo,
        boxSimulacroActive,
      );

      await certificadoStore.getSimulacroActive(boxSimulacroActive);

      certificadoStore.isLoading = false;
      certificadoStore.generated = true;

      return;
    }

    certificadoStore.isLoading = false;
    certificadoStore.generated = false;
  }

  @override
  void initState() {
    super.initState();
    generarSimulacro();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: Observer(
        builder:
            (_) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    certificadoStore.isLoading
                        ? const CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.limeAccent,
                        )
                        : Image.asset(
                          "assets/generar-simulacro.png",
                          width: 150,
                        ),
                    const SizedBox(height: 30),
                    Text(
                      certificadoStore.isLoading
                          ? 'Generando Simulacro...'
                          : certificadoStore.generated
                          ? 'Simulacro Generado'
                          : "Error",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      certificadoStore.isLoading
                          ? 'Estamos preparando tu simulacro.\nEsto puede tardar unos segundos.'
                          : certificadoStore.generated
                          ? 'El simulacro se ha generado exitosamente'
                          : "Hemos presentado errores al generar el simulacro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 50),
                    certificadoStore.generated
                        ? ElevatedButton(
                          onPressed: () {
                            certificadoStore.initializeTimer(
                              widget.simulacro.duracion,
                            );

                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.question,
                              (route) => false,
                              arguments: {'position': 0},
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.lime,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          child: const Text("Continuar"),
                        )
                        : Container(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
