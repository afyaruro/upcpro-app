import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Stores/Certificado/certificadoStore.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/RespuestaPreguntaEntity.dart';
import 'package:upcpro_app/Presentation/Screens/Question/widgets/HeaderQuestion.dart';
import 'package:upcpro_app/Presentation/Screens/Question/widgets/QuestionCard.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.position});

  final int position;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late RespuestaPreguntaEntity question;
  final storeCertificado = GetIt.instance<StoreCertificado>();

  @override
  void initState() {
    super.initState();
    question = storeCertificado.simulacroActivo!.listRespuesta[widget.position];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 28, 28, 28)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TimerHeader(
                  initialMinutes:
                      storeCertificado.simulacroActivo!.simulacro.duracion,
                  position: widget.position, 
                  totalQuestions:
                      storeCertificado.simulacroActivo!.listRespuesta.length,
                  onNextPressed: (nextPosition) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/question",
                      (route) => false,
                      arguments: {'position': nextPosition},
                    );
                  },
                ),
                SizedBox(height: fullHeight(context) * 0.01),
                QuestionCard(question: question),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildHint() {  para feeback
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 16),
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.black.withOpacity(0.3),
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Row(
  //       children: [
  //         const Icon(Icons.lightbulb_outline, color: Colors.yellow, size: 20),
  //         const SizedBox(width: 12),
  //         Expanded(
  //           child: Text(
  //             'Steve Wozniak and Steve Jobs sold 50 pieces of this at a price of US\$666.66',
  //             style: TextStyle(
  //               color: Colors.white.withOpacity(0.9),
  //               fontSize: 13,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
