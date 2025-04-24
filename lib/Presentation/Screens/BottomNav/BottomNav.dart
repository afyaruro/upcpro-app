import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upcpro_app/Presentation/Screens/Home/Home.dart';
import 'package:upcpro_app/Presentation/Screens/Perfil/ProfileScreen.dart';
import 'package:upcpro_app/Presentation/Screens/Simulacro/SimulacroScreen.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    const SimulacroScreen(),
    const SimulacroScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: fullWidth(context),
        height: 60,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 5),
              blurRadius: 15,
            ),
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuItem(index: 0, icon: "assets/home_icon.svg"),
              _buildMenuItem(index: 1, icon: "assets/simulacro_icon.svg"),
              _buildMenuItem(index: 2, icon: "assets/certificate.svg"),
              _buildMenuItem(index: 3, icon: "assets/setting_icon.svg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({required int index, required String icon}) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.lime : Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: AnimatedScale(
            scale: isSelected ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 400),
            child: SvgPicture.asset(
              icon,
              width: 25,
              height: 25,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : colorText(),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
