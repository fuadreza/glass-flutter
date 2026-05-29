import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry padding;

  const GlassContainer({
    super.key,
    required this.child,
    required this.width,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 24),
      child: SizedBox(
        width: width,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 24.0),
                  gradient: LinearGradient(
                    begin: Alignment(-0.5, -0.5),
                    end: Alignment(0.5, 0.5),
                    colors: [
                      Colors.white.withValues(alpha: 0.05),
                      Colors.white.withValues(alpha: 0.01),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: GradientBorderPainter(
                  strokeWidth: 0.5,
                  radius: borderRadius ?? 24.0,
                  gradient: LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: [
                      Colors.white.withValues(alpha: 0.2),
                      Colors.white.withValues(alpha: 0.0),
                      Colors.white.withValues(alpha: 0.0),
                      Colors.white.withValues(alpha: 0.2),
                    ],
                    stops: const [0.0, 0.2, 0.8, 1.0],
                  ),
                ),
                child: SizedBox(width: width),
              ),
            ),
            Container(
              margin: EdgeInsets.all(0.1),
              child: Padding(
                padding: padding,
                child: Center(child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  GradientBorderPainter({required this.strokeWidth, required this.radius, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);

    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
