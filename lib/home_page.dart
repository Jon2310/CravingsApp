import 'package:flutter/material.dart';
import 'dart:math' as math; // Code from https://www.youtube.com/watch?v=Xe0fDePMNQ8 for Hexagons

import 'login_page.dart';
import 'detailed_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool tSpicy = false;
  bool tSweet = false;
  bool tSavory = false;
  bool tSalty = false;
  bool tSour = false;
  bool tBitter = false;

  void _traverseToLogin()  {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage(),
        )
    );
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.tealAccent,
                Colors.blue,
                Colors.purple.shade900,
              ]
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Row(    // First Row
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  height: 110,
                  width: 130,
                  child: TextButton(

                    onPressed: () {
                      setState(() {
                      });
                      tSpicy = true;
                      debugPrint("Spicy: $tSpicy");
                    },
                    child: CustomPaint(
                      painter: HexagonPainter(const Offset(24, 12), 60, 1),
                      child: const Text(
                        'Spicy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(    // Second Row
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                SizedBox(
                  height: 110,
                  width: 130,
                  child: TextButton(
                    onPressed: () {
                      tSweet = true;
                      debugPrint("Sweet: $tSweet");
                    },
                    child: CustomPaint(
                      painter: HexagonPainter(const Offset(28, 12), 60, 2),
                      child: const Text(
                        'Sweet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 110,
                  width: 130,
                  child: TextButton(
                    onPressed: () {
                      tSavory = true;
                      debugPrint("Savory: $tSavory");
                    },
                    child: CustomPaint(
                      painter: HexagonPainter(const Offset(28, 12), 60, 3),
                      child: const Text(
                        'Savory',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(    // Third Row
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  height: 110,
                  width: 130,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedPage(
                          tSpicy: tSpicy,
                          tSweet: tSweet,
                          tSavory: tSavory,
                          tSalty: tSalty,
                          tSour: tSour,
                          tBitter: tBitter,
                      ),
                      )
                    ),
                    child: CustomPaint(
                      painter: HexagonPainter(const Offset(38, 12), 60, 4),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                )

                ,
              ],
            ),

            Row(    // Fourth Row
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                SizedBox(
                  height: 110,
                  width: 130,
                  child: TextButton(
                    onPressed: () {
                      tSalty = true;
                      debugPrint("Salty: $tSalty");
                    },
                    child: CustomPaint(
                      painter: HexagonPainter(const Offset(28, 12), 60, 5),
                      child: const Text(
                        'Salty',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 110,
                  width: 130,
                  child: TextButton(
                    onPressed: () {
                      tSour = true;
                      debugPrint("Sour: $tSour");
                    },
                    child: CustomPaint(
                      painter: HexagonPainter(const Offset(18, 12), 60, 6),
                      child: const Text(
                        'Sour',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(    // Fifth Row
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                SizedBox(
                  height: 110,
                  width: 130,
                  child: TextButton(
                    onPressed: () {
                      tBitter = true;
                      debugPrint("Bitter: $tBitter");
                    },
                    child: CustomPaint(
                      painter: HexagonPainter(const Offset(24, 12), 60, 7),
                      child: const Text(
                        'Bitter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _traverseToLogin,
        backgroundColor: Colors.grey,
        child: const Icon(Icons.account_circle, color: Colors.white),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter  {
  static const int hexagonSides = 6;
  final double radius;
  final Offset center;
  int hexVal;
  HexagonPainter(this.center, this.radius, this.hexVal);

  @override
  void paint(Canvas canvas, Size size)  {
    Paint paint = Paint()..color;
    switch(hexVal) {
      case 1:
        paint = Paint()..color = Colors.red;
        break;
      case 2:
        paint = Paint()..color = Colors.purple;
        break;
      case 3:
        paint = Paint()..color = Colors.orange;
        break;
      case 4:
        paint = Paint()..color = Colors.grey;
        break;
      case 5:
        paint = Paint()..color = Colors.blue;
        break;
      case 6:
        paint = Paint()..color = Colors.yellow;
        break;
      case 7:
        paint = Paint()..color = Colors.green;
        break;
    }
    Path path = createHexagonPath();
    canvas.drawPath(path, paint);
  }

  Path createHexagonPath()  {
    final path = Path();
    var angle = (math.pi * 2) / hexagonSides;
    Offset firstPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    path.moveTo((firstPoint.dx + center.dx), firstPoint.dy + center.dy);
    for (int i = 1; i <= hexagonSides; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x,y);
    }
    return path;
  }
  @override
  bool shouldRepaint(HexagonPainter oldDelegate) => false;
}
