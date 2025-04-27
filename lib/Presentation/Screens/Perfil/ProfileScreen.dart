import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Screens/Perfil/widget/BuildOptionsList.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset("assets/image.png", width: 100, height: 100),
            const SizedBox(height: 20),
            BuildOptionsList(),
            
          ],
        ),
      ),
    );
  }
}
