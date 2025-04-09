import 'package:flutter/material.dart';

Widget BuildTextFieldSignUp({
  required String hintText,
  required IconData icon,
  required TextEditingController controller,
  bool isPassword = false,
}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    style: const TextStyle(color: Color.fromARGB(255, 64, 65, 64)),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 64, 65, 64)),
      filled: true,
      fillColor: const Color.fromARGB(55, 180, 182, 180),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(icon, color: const Color.fromARGB(255, 64, 65, 64)),
    ),
  );
}