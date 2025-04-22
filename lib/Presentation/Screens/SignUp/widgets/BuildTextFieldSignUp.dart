import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

// ignore: non_constant_identifier_names
Widget BuildTextFieldSignUp({
  required String hintText,
  required IconData icon,
  required TextEditingController controller,
  bool isPassword = false,
}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    style: TextStyle(color: colorText()),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: colorText()),
      filled: true,
      fillColor: const Color.fromARGB(55, 180, 182, 180),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(icon, color: colorText()),
    ),
  );
}