import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class CustomStatusDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final bool isLoading;

  const CustomStatusDialog({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    this.iconColor = Colors.lime,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                    strokeWidth: 3,
                  )
                : Icon(
                    icon,
                    size: 50,
                    color: iconColor,
                  ),
            const SizedBox(height: 20),
            Text(
              title,
              style:  textStyle(fontSize: 18, fontWeight: FontWeight.w700 , colortext: iconColor),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: textStyle(fontSize: 15, fontWeight: FontWeight.w500 , colortext: iconColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
