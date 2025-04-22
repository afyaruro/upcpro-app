import 'dart:convert';

import 'package:flutter/material.dart';

class SelectImageSignUp extends StatelessWidget {
  const SelectImageSignUp({
    super.key,
    required this.image,
    required this.imageAsset,
    required this.function,
  });

  final dynamic image;
  final dynamic imageAsset;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(29, 71, 111, 245),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(75),
          color: const Color.fromARGB(0, 255, 255, 255),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 60,
        height: 60,
        padding:
            image == null
                ? const EdgeInsets.only(top: 10)
                : const EdgeInsets.all(0),

        child: ClipOval(
          child:
              image == null
                  ? Image.asset(imageAsset)
                  : Image.memory(base64Decode(image)),
        ),
      ),
    );
  }
}