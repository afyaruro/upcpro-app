import 'package:flutter/material.dart';
import 'package:upcpro_app/Domain/Entities/Simulacro/SimulacroEntity.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class CardSimulacro extends StatefulWidget {
  final SimulacroEntity simulacro;
  const CardSimulacro({super.key, required this.simulacro});

  @override
  // ignore: library_private_types_in_public_api
  _CardSimulacroState createState() => _CardSimulacroState();
}

class _CardSimulacroState extends State<CardSimulacro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return hours > 0 ? '$hours h $mins min' : '$mins min';
  }

  Duration get _timeRemaining {
    final now = DateTime.now();
    final difference = widget.simulacro.fechaLimite.difference(now);
    return difference.isNegative ? Duration.zero : difference;
  }

  Widget _buildTimeRemaining() {
    final remaining = _timeRemaining;
    if (remaining.inDays > 0) {
      final days = remaining.inDays;
      final color = days < 2 ? Colors.orange : Colors.green;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(Icons.timer, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              '$days días restantes',
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    } else {
      final hours = remaining.inHours;
      final color = Colors.red;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(Icons.timer, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              '$hours horas restantes',
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: fullWidth(context),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(97, 153, 153, 153),
            offset: Offset(0, 0),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.simulacro.name == null ? "" : widget.simulacro.name!,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle(
                      colortext: colorText(),
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () async {
                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   "/generando-simulacro",
                    //   (route) => false,
                    //   arguments: {'simulacro': widget.simulacro},
                    // );

                    Navigator.pushNamed(
                      context,
                      '/generando-simulacro',
                      arguments: {'simulacro': widget.simulacro},
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lime,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(18, 9, 20, 7),
                    child: const Text(
                      "Iniciar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTimeRemaining(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F4FF),
                    border: Border.all(
                      color: const Color(0xFF0078D4),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.timelapse,
                        color: Color(0xFF0056A3),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatDuration(widget.simulacro.duracion),
                        style: const TextStyle(
                          color: Color(0xFF005299),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            _buildInfoItem(
              Icons.help_outline,
              '${widget.simulacro.numeroPreguntas} preguntas',
            ),
          ],
        ),
      ),
    );
  }
}
