import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class AlertCustomButom extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final bool isLoading;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const AlertCustomButom({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    this.iconColor = Colors.lime,
    this.isLoading = false,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                  : Icon(icon, size: 50, color: iconColor),
              Text(
                title,
                style: textStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  colortext: iconColor,
                ),
              ),

              if (buttonText != null) ...[
                TextButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    buttonText!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
