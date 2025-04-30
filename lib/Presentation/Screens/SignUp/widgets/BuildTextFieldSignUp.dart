import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class BuildTextFieldSignUp extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;

  const BuildTextFieldSignUp({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<BuildTextFieldSignUp> createState() => _BuildTextFieldSignUpState();
}

class _BuildTextFieldSignUpState extends State<BuildTextFieldSignUp> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      style: TextStyle(color: colorText()),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: colorText()),
        filled: true,
        fillColor: const Color.fromARGB(55, 180, 182, 180),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(widget.icon, color: colorText()),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: colorText(),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
