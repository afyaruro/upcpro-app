import 'package:flutter/material.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/CertificadoEntity.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/RespuestaPreguntaEntity.dart';
import 'package:upcpro_app/Infrastructure/Config/Routes/Routes.dart';
import 'package:upcpro_app/Presentation/Screens/QuestionResult/widgets/QuestionResultCard.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class QuestionResultScreen extends StatefulWidget {
  const QuestionResultScreen({
    super.key,
    required this.position,
    required this.result,
  });

  final int position;
  final CertificadoEntity result;

  @override
  State<QuestionResultScreen> createState() => _QuestionResultScreenState();
}

class _QuestionResultScreenState extends State<QuestionResultScreen> {
  late RespuestaPreguntaEntity question;

  @override
  void initState() {
    super.initState();
    question = widget.result.listRespuesta[widget.position];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      appBar: AppBar(
        backgroundColor: backgroundColor(),
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.exitResult,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: backgroundColor()),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHint(question.feedback),
                  SizedBox(height: fullHeight(context) * 0.01),
                  QuestionResultCard(question: question),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor(),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              int nextPosition = widget.position + 1;
              if (nextPosition < widget.result.listRespuesta.length) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.result,
                  arguments: {
                    "result": widget.result,
                    "position": nextPosition,
                  },
                );
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.exitResult,
                  (route) => false,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              widget.position + 1 < widget.result.listRespuesta.length
                  ? "Siguiente"
                  : 'Finalizar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHint(String feeback) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb_outline, color: Colors.yellow, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Retroalimentacion",
                  style: textStyle(
                    colortext: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  feeback,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
