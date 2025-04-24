import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/Certificado/CertificadoService.dart';
import 'package:upcpro_app/Application/Stores/Certificado/certificadoStore.dart';

class TimerHeader extends StatefulWidget {
  final int position;
  final int totalQuestions;
  final Function(int) onNextPressed;
  final int initialMinutes;

  const TimerHeader({
    Key? key,
    required this.position,
    required this.totalQuestions,
    required this.onNextPressed,
    required this.initialMinutes,
  }) : super(key: key);

  @override
  State<TimerHeader> createState() => _TimerHeaderState();
}

class _TimerHeaderState extends State<TimerHeader> {
  Timer? _timer;
  final storeCertificado = GetIt.instance<StoreCertificado>();
  final serviceCertificado = GetIt.instance<CertificadoService>();

  @override
  void initState() {
    super.initState();

    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    storeCertificado.startTimer();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      storeCertificado.decrementTimer();

      if (storeCertificado.totalSeconds <= 0) {
        _timer?.cancel();
        //aca lo saca y guarda el simulacro
        print("Aca se acabo el tiempo");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 6),
                Text(
                  '${widget.position + 1}/${widget.totalQuestions}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Observer(
            builder:
                (_) => ElevatedButton(
                  onPressed:
                      storeCertificado.optionSelected != 0
                          ? () async {
                            
                            Box boxSimulacroActive = await Hive.openBox(
                              'simulacroActivo',
                            );
                            storeCertificado
                                .simulacroActivo!
                                .listRespuesta[widget.position]
                                .isResponse = true;
                            storeCertificado
                                    .simulacroActivo!
                                    .listRespuesta[widget.position]
                                    .selectedOption =
                                storeCertificado.optionSelected;
                            storeCertificado.optionSelected = 0;
                            await serviceCertificado.saveCertificadosHive(
                              storeCertificado.simulacroActivo!,
                              boxSimulacroActive,
                            );

                            if (widget.position + 1 ==
                                storeCertificado
                                    .simulacroActivo!
                                    .listRespuesta
                                    .length) {
                              print("hola Mundo aca termino el simulacro");
                              return;
                            }

                            widget.onNextPressed(widget.position + 1);
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime,
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                    disabledBackgroundColor: const Color.fromARGB(
                      198,
                      42,
                      42,
                      42,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Siguiente',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
          ),

          Observer(
            builder:
                (_) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.timer, color: Colors.lime, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        storeCertificado.formattedTime,
                        style: TextStyle(
                          color:
                              (storeCertificado.totalSeconds <= 30)
                                  ? Colors.red
                                  : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
