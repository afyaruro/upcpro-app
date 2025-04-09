
import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class BarraProgreso extends StatelessWidget {
  final double porcentaje;
  const BarraProgreso({super.key, required this.porcentaje});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth(context),
      color: const Color.fromARGB(255, 224, 240, 203),
      height: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            width: porcentaje,
          ),
        ],
      ),
    );
  }
}