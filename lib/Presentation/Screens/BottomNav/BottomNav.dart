import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Screens/Home/Home.dart';
import 'package:upcpro_app/Presentation/Screens/Ranking/Ranking.dart';
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
    const Home(),
    RankingScreen(),
    const Home(),
    // SimulacrosScreen(),
    // RankingScreen(),
    // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        width: fullWidth(context),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(31, 87, 87, 87),
              offset: Offset(0, -2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenuItem(
                index: 0,
                icon: Icons.home_outlined,
                label: "Home",
              ),
              _buildMenuItem(
                index: 1,
                icon: Icons.edit_outlined,
                label: "Simulacros",
              ),
              _buildMenuItem(
                index: 2,
                icon: Icons.workspace_premium_outlined,
                label: "Ranking",
              ),
              _buildMenuItem(
                index: 3,
                icon: Icons.person_outline,
                label: "Perfil",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
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
        padding:
            isSelected
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 2)
                : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 158, 220, 57) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color:
                  isSelected ? Colors.white : Color.fromARGB(255, 0, 0, 0),
            ),
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected ? Colors.white : Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
