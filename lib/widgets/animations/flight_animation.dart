import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FlightAnimation extends StatefulWidget {
  const FlightAnimation({super.key, this.duration});

  final Duration? duration;

  @override
  State<FlightAnimation> createState() => _FlightAnimationState();
}

class _FlightAnimationState extends State<FlightAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VisibilityDetector(
          key: UniqueKey(),
          child: SizedBox(),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.0) {
              _controller.forward();
            } else {
              _controller.stop();
            }
          },
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final iconSize = 36.0;
            final flightPathWidth = maxWidth - iconSize;

            return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final currentPosition = flightPathWidth * _animation.value;

                return SizedBox(
                  width: maxWidth,
                  height: iconSize,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(width: 0 + currentPosition, height: 2, color: Colors.grey),
                      Positioned(
                        left: currentPosition,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: iconSize,
                          width: iconSize,
                          child: Transform.rotate(
                            angle: -math.pi / -2,
                            child: Icon(Icons.local_airport, size: iconSize, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
