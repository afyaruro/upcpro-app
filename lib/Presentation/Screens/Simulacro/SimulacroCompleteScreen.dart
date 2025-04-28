import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/CertificadoEntity.dart';
import 'package:upcpro_app/Infrastructure/Config/Routes/Routes.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class SimulacroCompleteScreen extends StatefulWidget {
  const SimulacroCompleteScreen({super.key, required this.result});

  final CertificadoEntity result;

  @override
  State<SimulacroCompleteScreen> createState() =>
      _SimulacroCompleteScreenState();
}

class _SimulacroCompleteScreenState extends State<SimulacroCompleteScreen>
    with SingleTickerProviderStateMixin {
  late int score = 0;
  late int totalQuestions = 0;
  late int puntajeLectura = 0;
  late int puntajeRazonamiento = 0;
  late int puntajeIngles = 0;
  late int puntajeCiudadanas = 0;
  static const String nameLectura = "LECTURA CRÍTICA";
  static const String nameRazonamiento = "RAZONAMIENTO CUANTITATIVO";
  static const String nameIngles = "INGLÉS";
  static const String nameCiudadanas = "COMPETENCIAS CIUDADANAS";
  late int numLectura = 0;
  late int numRazonamiento = 0;
  late int numIngles = 0;
  late int numCiudadanas = 0;

  late int correctLectura = 0;
  late int correctRazonamiento = 0;
  late int correctIngles = 0;
  late int correctCiudadanas = 0;

  late AnimationController _animationController;
  late Animation<double> _animation;

  int _animatedScore = 0;
  int _animatedLectura = 0;
  int _animatedRazonamiento = 0;
  int _animatedIngles = 0;
  int _animatedCiudadanas = 0;

  late CertificadoEntity simulacrum;
  final storeGeneric = GetIt.instance<StoreGeneric>();

  @override
  void initState() {
    super.initState();
    simulacrum = widget.result;

    calculatePuntaje();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animation.addListener(() {
      setState(() {
        _animatedScore = (score * _animation.value).round();
        _animatedLectura = (puntajeLectura * _animation.value).round();
        _animatedRazonamiento =
            (puntajeRazonamiento * _animation.value).round();
        _animatedIngles = (puntajeIngles * _animation.value).round();
        _animatedCiudadanas = (puntajeCiudadanas * _animation.value).round();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void calculatePuntaje() {
    numLectura = numRazonamiento = numIngles = numCiudadanas = 0;
    correctLectura =
        correctRazonamiento = correctIngles = correctCiudadanas = 0;

    for (var question in simulacrum.listRespuesta) {
      final competence = storeGeneric.competences.firstWhere(
        (c) => c.id == question.idCompetence,
      );

      if (competence.name == nameRazonamiento) {
        numRazonamiento++;
        if (question.selectedOption == question.correctAnswer) {
          correctRazonamiento++;
        }
      } else if (competence.name == nameIngles) {
        numIngles++;
        if (question.selectedOption == question.correctAnswer) {
          correctIngles++;
        }
      } else if (competence.name == nameLectura) {
        numLectura++;
        if (question.selectedOption == question.correctAnswer) {
          correctLectura++;
        }
      } else if (competence.name == nameCiudadanas) {
        numCiudadanas++;
        if (question.selectedOption == question.correctAnswer) {
          correctCiudadanas++;
        }
      }
    }

    puntajeRazonamiento =
        numRazonamiento == 0
            ? 0
            : ((correctRazonamiento / numRazonamiento) * 300).round();
    puntajeIngles =
        numIngles == 0 ? 0 : ((correctIngles / numIngles) * 300).round();
    puntajeLectura =
        numLectura == 0 ? 0 : ((correctLectura / numLectura) * 300).round();
    puntajeCiudadanas =
        numCiudadanas == 0
            ? 0
            : ((correctCiudadanas / numCiudadanas) * 300).round();

    if (simulacrum.simulacro.type == "ALL") {
      int sumaPuntajes =
          puntajeCiudadanas +
          puntajeIngles +
          puntajeLectura +
          puntajeRazonamiento;
      score = (sumaPuntajes / 4).round();
    } else {
      final competenceType = storeGeneric.competences.firstWhere(
        (c) => c.id == simulacrum.simulacro.type,
      );

      switch (competenceType.name) {
        case nameRazonamiento:
          score = puntajeRazonamiento;
          break;
        case nameIngles:
          score = puntajeIngles;
          break;
        case nameLectura:
          score = puntajeLectura;
          break;
        case nameCiudadanas:
          score = puntajeCiudadanas;
          break;
        default:
          score = 0;
          break;
      }
    }
  }

  String _formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
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

      body: SizedBox(
        width: fullWidth(context),
        height: fullHeight(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),

              Text(
                'Resultados del Simulacro',
                style: textStyle(
                  colortext: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 50),

              SvgPicture.asset(
                'assets/trophy.svg',
                width: 120,
                height: 120,
                color: Colors.amber,
              ),
              const SizedBox(height: 10),

              const Text(
                'Tiempo',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.5,
                ),
              ),

              Text(
                _formatDuration(simulacrum.duracion!),
                style: TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 10),
              const Text(
                'Puntaje',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$_animatedScore',
                      style: TextStyle(
                        color:
                            _animatedScore < 100
                                ? Colors.red
                                : _animatedScore < 140
                                ? Colors.orange
                                : _animatedScore < 170
                                ? Colors.amber
                                : _animatedScore < 200
                                ? Colors.blue
                                : Color(0xFF4CD964),
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '/300',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                'Competencias Evaluadas',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  puntajeCiudadanas > 0 || simulacrum.simulacro.type == "ALL"
                      ? _buildBadge(
                        color:
                            _animatedCiudadanas < 100
                                ? Colors.red
                                : _animatedCiudadanas < 140
                                ? Colors.orange
                                : _animatedCiudadanas < 170
                                ? Colors.amber
                                : _animatedCiudadanas < 200
                                ? Colors.blue
                                : Color(0xFF4CD964),
                        label: "Ciudadanas",
                        value: _animatedCiudadanas,
                      )
                      : SizedBox.shrink(),
                  puntajeIngles > 0 || simulacrum.simulacro.type == "ALL"
                      ? _buildBadge(
                        color:
                            _animatedIngles < 100
                                ? Colors.red
                                : _animatedIngles < 140
                                ? Colors.orange
                                : _animatedIngles < 170
                                ? Colors.amber
                                : _animatedIngles < 200
                                ? Colors.blue
                                : Color(0xFF4CD964),
                        label: "Inglés",
                        value: _animatedIngles,
                      )
                      : SizedBox.shrink(),
                  puntajeLectura > 0 || simulacrum.simulacro.type == "ALL"
                      ? _buildBadge(
                        color:
                            _animatedLectura < 100
                                ? Colors.red
                                : _animatedLectura < 140
                                ? Colors.orange
                                : _animatedLectura < 170
                                ? Colors.amber
                                : _animatedLectura < 200
                                ? Colors.blue
                                : Color(0xFF4CD964),
                        label: "Lectura",
                        value: _animatedLectura,
                      )
                      : SizedBox.shrink(),
                  puntajeRazonamiento > 0 || simulacrum.simulacro.type == "ALL"
                      ? _buildBadge(
                        color:
                            _animatedRazonamiento < 100
                                ? Colors.red
                                : _animatedRazonamiento < 140
                                ? Colors.orange
                                : _animatedRazonamiento < 170
                                ? Colors.amber
                                : _animatedRazonamiento < 200
                                ? Colors.blue
                                : Color(0xFF4CD964),
                        label: "Razonamiento",
                        value: _animatedRazonamiento,
                      )
                      : SizedBox.shrink(),
                ],
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.result,
                            arguments: {"result": widget.result, "position": 0},
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lime,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),

                        child: const Text('Ver mis respuestas'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge({
    required String label,
    required int value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          Text(
            '$label: $value/300',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
