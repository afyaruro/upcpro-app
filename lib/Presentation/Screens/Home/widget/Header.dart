import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  final String competencia;
  final IconData icon;
  final Function(String, IconData) actualizarCompetencia;

  const HeaderHome({
    super.key,
    required this.competencia,
    required this.icon,
    required this.actualizarCompetencia,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(85, 180, 180, 180),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _showCompetenciesModal(context),
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            color: const Color.fromARGB(255, 86, 131, 15),
                            size: 30.0,
                          ),
                          const SizedBox(width: 2),
                          SizedBox(
                            width: 100,
                            child: Text(
                              competencia,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 86, 131, 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              color: Color.fromARGB(255, 255, 115, 0),
                              size: 20.0,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 115, 0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 228, 51, 51),
                              size: 20.0,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "0",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 228, 51, 51),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.diamond_outlined,
                              color: Color.fromARGB(255, 51, 172, 228),
                              size: 20.0,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "0k",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 51, 172, 228),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCompetenciesModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Selecciona una competencia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildCompetencyOption(
                context,
                "Razonamiento Cuantitativo",
                Icons.calculate,
              ),
              _buildCompetencyOption(context, "Lectura Crítica", Icons.book),
              _buildCompetencyOption(
                context,
                "Competencias Ciudadanas",
                Icons.people,
              ),
              _buildCompetencyOption(context, "Inglés", Icons.translate),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompetencyOption(
    BuildContext context,
    String nombre,
    IconData icono,
  ) {
    return ListTile(
      leading: Icon(icono),
      title: Text(nombre),
      onTap: () {
        // final ControllerNiveles controllerNiv = Get.find();
        actualizarCompetencia(nombre, icono); // Llamamos el callback
        Navigator.pop(context); // Cerramos el modal
      },
    );
  }
}
