import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Application/Services/Init/InitService.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _fadeAnimation;
  final storeUser = GetIt.instance<StoreUser>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);

    Future.delayed(const Duration(seconds: 4), () async {
       Box boxConfig = await Hive.openBox('config');
          Box boxFaculty = await Hive.openBox('faculty');
          Box boxCompetence = await Hive.openBox('competence');
          Box boxProgram = await Hive.openBox('program');
          Box boxQuestion = await Hive.openBox('question');
          Box boxInfoQuestion = await Hive.openBox('infoQuestion');
          Box boxSimulacro = await Hive.openBox('simulacro');


          InitService service = InitService(context: context);
          await service.Init(
            boxCompetence: boxCompetence,
            boxConfig: boxConfig,
            boxFaculty: boxFaculty,
            boxProgram: boxProgram,
            boxInfoquestion: boxInfoQuestion,
            boxQuestion: boxQuestion,
            boxSimulacro: boxSimulacro
          );
    });
  }

  PageRouteBuilder createFadeTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      transitionDuration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lime,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(opacity: _fadeAnimation.value, child: child);
              },
              child: Image.asset(
                "assets/image.png",
                width: 150,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
