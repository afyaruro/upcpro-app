import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/Simulacro/SimulacroService.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';
import 'package:upcpro_app/Domain/Entities/Simulacro/SimulacroEntity.dart';
import 'package:upcpro_app/Presentation/Screens/Simulacro/SimulacroScreen1.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class SimulacroScreen extends StatefulWidget {
  const SimulacroScreen({super.key});

  @override
  State<SimulacroScreen> createState() => _SimulacroScreenState();
}

class _SimulacroScreenState extends State<SimulacroScreen>
    with SingleTickerProviderStateMixin {
  final storeUser = GetIt.instance<StoreUser>();
  final storeGeneric = GetIt.instance<StoreGeneric>();

  late AnimationController _controller;
  late Animation<double> _backgroundAnimation;
  late Animation<double> _fadeAnimation;

  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _opacityAnimations;

  final List<SimulacroEntity> simulacros = [];

  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    simulacros.addAll(storeGeneric.simulacros);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _backgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
      ),
    );

    _slideAnimations = List.generate(
      simulacros.length,
      (index) => Tween<Offset>(
        begin: const Offset(0.0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.4 + (index * 0.05),
            0.7 + (index * 0.05),
            curve: Curves.easeOutCubic,
          ),
        ),
      ),
    );

    _opacityAnimations = List.generate(
      simulacros.length,
      (index) => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.4 + (index * 0.05),
            0.7 + (index * 0.05),
            curve: Curves.easeIn,
          ),
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  Widget buildSimulacro(BuildContext context) {
    return simulacros.isNotEmpty
        ? Column(
          children: [
            for (var i = 0; i < simulacros.length; i++)
              SlideTransition(
                position: _slideAnimations[i],
                child: FadeTransition(
                  opacity: _opacityAnimations[i],
                  child: CardSimulacro(simulacro: simulacros[i]),
                ),
              ),
          ],
        )
        : Text(
          "No hay simulacros disponibles",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _refreshSimulacros() async {
    Box boxSimulacro = await Hive.openBox('Simulacro');
    final simulacroService = GetIt.instance<SimulacroService>();

    var respSimulacroDio = await simulacroService.getSimulacroDio(
      storeUser.token,
    );
    await simulacroService.saveSimulacrosHive(
      SimulacroEntity.toListModel(respSimulacroDio.entities!),
      boxSimulacro,
    );
    await storeGeneric.getSimulacros(boxSimulacro);

    setState(() {
      _isRefreshing = true;
    });

    _controller.reset();

    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _isRefreshing = false;
      });
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _backgroundAnimation,
              builder: (context, child) {
                return Container(
                  width: fullWidth(context),
                  height:
                      fullHeight(context) * 0.5 * _backgroundAnimation.value,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 41, 41, 41),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        50 * _backgroundAnimation.value,
                      ),
                      bottomRight: Radius.circular(
                        50 * _backgroundAnimation.value,
                      ),
                    ),
                  ),
                );
              },
            ),

            Column(
              children: [
                SizedBox(height: 120),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Simulacros",
                          style: textStyle(
                            colortext: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 800),
                          builder: (context, value, child) {
                            return Transform.scale(scale: value, child: child);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lime,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                _isRefreshing
                                    ? Container(
                                      width: 48,
                                      height: 48,
                                      padding: const EdgeInsets.all(12),
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                    )
                                    : IconButton(
                                      onPressed: _refreshSimulacros,
                                      icon: const Icon(
                                        Icons.refresh_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                buildSimulacro(context),

                SizedBox(height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
