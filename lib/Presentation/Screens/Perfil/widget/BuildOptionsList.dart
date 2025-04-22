import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BuildOptionsList() {
  final List<Map<String, dynamic>> options = [
    {
      'icon': Icons.person,
      'text': 'Datos Personales',
      'color': Colors.blue,
      'action': () {},
    },

    {
      'icon': Icons.lock,
      'text': 'Cambiar Contraseña',
      'color': Colors.red,
      'action': () {},
    },
    {
      'icon': Icons.exit_to_app,
      'text': 'Cerrar Sesión',
      'color': Colors.purple,
      'action': () {},
    },
  ];

  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: options.length,
    separatorBuilder: (_, __) => const SizedBox(height: 15),
    itemBuilder: (context, index) {
      final option = options[index];
      return InkWell(
        onTap: option['action'],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: option['color']?.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(option['icon'], color: option['color']),
              ),
              const SizedBox(width: 15),
              Text(
                option['text'],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
    },
  );
}
