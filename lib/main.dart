import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Abishur\'s Portfolio',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: FolderPainter(),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
              const Center(
                child: Text(
                  'Abishur\'s Binder',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FolderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final mainP = Paint()
      ..color = Color(0xFFF3E5AB)
      ..style = PaintingStyle.fill;

    final paperP = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    // Back Page
    path.moveTo(size.width * 0.01, size.height * 0.10);
    path.lineTo(size.width * 0.60, size.height * 0.10);
    path.lineTo(size.width * 0.65, size.height * 0.05);
    path.lineTo(size.width * 0.95, size.height * 0.05);
    path.lineTo(size.width, size.height * 0.10);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.01, size.height);
    path.close();

    canvas.drawPath(path, mainP);
    path.reset();

    // Paper
    path.moveTo(size.width * 0.98, size.height * 0.115);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width - (size.width * 0.98), size.height * 0.115);
    path.close();

    canvas.drawPath(path, paperP);
    path.reset();

    // Front Page
    path.moveTo(0, size.height * 0.13);
    path.lineTo(size.width * 0.60, size.height * 0.13);
    path.lineTo(size.width * 0.65, size.height * 0.16);
    path.lineTo(size.width, size.height * 0.16);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, mainP);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
