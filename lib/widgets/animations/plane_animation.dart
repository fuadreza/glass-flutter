import 'dart:math' as math;

import 'package:flutter/material.dart';

class PlaneAnimation extends StatefulWidget {
  const PlaneAnimation({super.key});

  @override
  State<PlaneAnimation> createState() => _PlaneAnimationState();
}

class _PlaneAnimationState extends State<PlaneAnimation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CustomPaint(
          size: Size(1, 50),
          painter: DashedVerticalLine(),
        ),
        Transform.rotate(
          angle: -math.pi,
          child: const Icon(
            Icons.local_airport,
            size: 36,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class DashedVerticalLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final dashHeight = 5.0;
    final dashSpace = 3.0;
    var startY = 0.0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.0
      ..strokeWidth = size.width;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
