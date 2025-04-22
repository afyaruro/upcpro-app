// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:upcpro_app/Presentation/Utils/styles.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(30),
//         color: Colors.white,
//         width: fullWidth(context),
//         height: fullHeight(context),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//                SizedBox(height: fullHeight(context) * 0.1),
//               Container(
//                 width: fullWidth(context),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Welcome.",
//                       style: GoogleFonts.krub(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w600,
//                         color: const Color.fromARGB(255, 197, 197, 197),
//                       ),
//                     ),

//                     Text(
//                       "Anna Lane!",
//                       style: GoogleFonts.krub(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600,
//                         color: const Color.fromARGB(255, 51, 50, 50),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Path UI',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const LearningPathScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D4777), // Purple background
      body: Stack(
        children: [
          // Custom path painter
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            painter: PathPainter(),
          ),

          // Units and decorative elements
          Positioned(top: 120, right: 100, child: _buildUnitBox("Unit 3")),

          Positioned(top: 230, left: 80, child: _buildUnitBox("Unit 2")),

          Positioned(top: 340, right: 100, child: _buildUnitBox("Unit 1")),

          // Decorative pumpkins
          Positioned(top: 110, right: 60, child: _buildDecoration("🎃", 24)),

          Positioned(top: 250, right: 140, child: _buildDecoration("🎃", 24)),

          Positioned(top: 380, left: 60, child: _buildDecoration("🎃", 24)),

          // Decorative ghosts
          Positioned(top: 190, left: 120, child: _buildDecoration("👻", 20)),

          Positioned(top: 320, right: 150, child: _buildDecoration("👻", 20)),

          Positioned(top: 450, left: 150, child: _buildDecoration("👻", 20)),

          // Review button at top
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                ),
                child: const Text('Review', style: TextStyle(fontSize: 16)),
              ),
            ),
          ),

          // Start button at bottom
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF1913D), // Orange
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.flag, color: Colors.white),
                      const SizedBox(height: 2),
                      const Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Trophy icon
          Positioned(
            bottom: 180,
            right: 100,
            child: _buildDecoration("🏆", 22),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitBox(String title) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.book, size: 18, color: Color(0xFF5D4777)),
          const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF5D4777),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDecoration(String emoji, double size) {
    return Text(emoji, style: TextStyle(fontSize: size));
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white.withOpacity(0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;

    // Create a path with a wavy line
    final Path path = Path();
    path.moveTo(size.width / 2, size.height - 120); // Start from bottom center

    // Create a curved path going up
    path.cubicTo(
      size.width * 0.2,
      size.height - 200, // Control point 1
      size.width * 0.8,
      size.height - 300, // Control point 2
      size.width * 0.3,
      size.height - 350, // End point
    );

    path.cubicTo(
      size.width * 0.1,
      size.height - 380, // Control point 1
      size.width * 0.2,
      size.height - 450, // Control point 2
      size.width * 0.7,
      size.height - 480, // End point
    );

    path.cubicTo(
      size.width * 0.9,
      size.height - 500, // Control point 1
      size.width * 0.8,
      size.height - 550, // Control point 2
      size.width * 0.5,
      size.height - 580, // End point (top center)
    );

    final dashResult = createDashPath(
      path,
      dashArray: CircularIntervalList<double>([8, 4]),
    );

    canvas.drawPath(dashResult, paint);
  }

  Path dashPath(Path path, {required CircularIntervalList<double> dashArray}) {
    final dashPath = Path();
    final dashOffset = 0.0;

    // Create a dash path
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;

      while (distance < metric.length) {
        final double len = dashArray.next;
        if (draw) {
          dashPath.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
      }
    }

    return dashPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  createDashPath(Path path, {required CircularIntervalList<double> dashArray}) {
    final dashPath = Path();
    final dashOffset = 0.0;

    // Create a dash path
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;

      while (distance < metric.length) {
        final double len = dashArray.next;
        if (draw) {
          dashPath.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
      }
    }

    return dashPath;
  }
}

class CircularIntervalList<T> {
  final List<T> _values;
  int _index = 0;

  CircularIntervalList(this._values);

  T get next {
    if (_index >= _values.length) {
      _index = 0;
    }
    return _values[_index++];
  }
}
