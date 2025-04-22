import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 3,
            ),
            SizedBox(height: 20),
            Text(
              'Cargando...',
              style: textStyle(fontSize: 15, fontWeight: FontWeight.w700 , colortext: const Color.fromARGB(255, 31, 30, 30)),
            ),
            SizedBox(height: 8),
            Text(
              'Por favor espera un momento',
              style: textStyle(fontSize: 15, fontWeight: FontWeight.w500 , colortext: const Color.fromARGB(255, 31, 30, 30)),
            ),
          ],
        ),
      ),
    );
  }
}
