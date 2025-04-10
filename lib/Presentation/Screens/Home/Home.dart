import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Screens/Home/widget/Header.dart';

class Nivel {
  final int id;
  final int nivel;
  final int dificultad;
  final int competencia;
  // final List<Pregunta> preguntas;

  Nivel({
    required this.nivel,
    required this.competencia,
    // required this.preguntas,
    required this.dificultad,
    required this.id,
  });

  factory Nivel.fromJson(Map<String, dynamic> json) {
    return Nivel(
      // preguntas: json['preguntas'],
      competencia: json['competencia'],
      nivel: json['nivel'],
      dificultad: json['dificultad'],
      id: json['id'],
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? competencia;
  IconData? icon;

  final List<Map<String, dynamic>> competencias = [
    {"nombre": "Razonamiento Cuantitativo", "icono": Icons.calculate},
    {"nombre": "Inglés", "icono": Icons.translate},
    {"nombre": "Lectura Crítica", "icono": Icons.book},
    {"nombre": "Competencias Ciudadanas", "icono": Icons.people},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _mostrarSeleccionCompetencia(),
    );
  }

  void _mostrarSeleccionCompetencia() async {
    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Selecciona tu competencia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: competencias.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      competencias[index]['icono'],
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    title: Text(competencias[index]['nombre']),
                    onTap: () {
                      setState(() {
                        competencia = competencias[index]['nombre'];
                        icon = competencias[index]['icono'];
                      });
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final ControllerNiveles controllerNiv = Get.find();
    final List<Nivel> niveles = [
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
      Nivel(nivel: 1, competencia: 1, dificultad: 1, id: 1),
    ];

    // Filtrar niveles por competencia seleccionada
    List<Nivel> nivelesFiltrados = [];
    if (competencia != null) {
      int indiceCompetencia =
          competencias.indexWhere((comp) => comp['nombre'] == competencia) + 1;
      nivelesFiltrados =
          niveles
              .where((nivel) => nivel.competencia == indiceCompetencia)
              .toList();
    }

    const double patternHeight = 530;
    int totalCycles = (nivelesFiltrados.length / 9).ceil();
    double totalHeight = totalCycles * patternHeight;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/fondo_home.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: const Color.fromARGB(200, 255, 255, 255)),
          ),
          Column(
            children: [
              if (competencia != null && icon != null)
                HeaderHome(
                  competencia: competencia!,
                  icon: icon!,
                  actualizarCompetencia: (nuevaCompetencia, nuevoIcono) {
                    setState(() {
                      int indiceCompetencia =
                          competencias.indexWhere(
                            (comp) => comp['nombre'] == competencia,
                          ) +
                          1;
                      nivelesFiltrados =
                          niveles
                              .where(
                                (nivel) =>
                                    nivel.competencia == indiceCompetencia &&
                                    nivel.nivel <= 4,
                              )
                              .toList();
                      competencia = nuevaCompetencia;
                      icon = nuevoIcono;
                    });
                  },
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: totalHeight,
                    child: Stack(
                      children: [
                        for (int i = 0; i < nivelesFiltrados.length; i++)
                          nodoNivel(nivelesFiltrados[i], i),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget nodoNivel(Nivel nivel, int index) {
    double left = 0;
    double right = 0;
    double top = 0;

    const double patternHeight = 510;
    int cycle = index ~/ 9;
    int positionInCycle = index % 9;
    double verticalOffset = cycle * patternHeight;

    switch (positionInCycle) {
      case 0:
        left = 0;
        top = 20;
        break;
      case 1:
        left = 160;
        top = 60;
        break;
      case 2:
        left = 240;
        top = 150;
        break;
      case 3:
        left = 230;
        top = 240;
        break;
      case 4:
        left = 80;
        top = 280;
        break;
      case 5:
        right = 80;
        top = 270;
        break;
      case 6:
        right = 220;
        top = 330;
        break;
      case 7:
        right = 250;
        top = 410;
        break;
      case 8:
        right = 200;
        top = 490;
        break;
      default:
        break;
    }

    top += verticalOffset;

    return Positioned(
      left: left,
      top: top,
      right: right,
      child: btnNivel(nivel: nivel),
    );
  }
}

class btnNivel extends StatelessWidget {
  final Nivel nivel;

  const btnNivel({super.key, required this.nivel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => PreguntaBasica(
        //               preguntas: nivel.preguntas,
        //               index: 0,
        //             )));
      },
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 61, 143, 7),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 149, 202, 26),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${nivel.nivel}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          nivel.dificultad,
                          (index) => const Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                            color: Color.fromARGB(255, 253, 220, 71),
                          ),
                        ),
                      ),
                    ],
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
