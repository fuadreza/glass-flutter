import 'dart:ui';

import 'package:flutter/material.dart';

class SlideToAct extends StatefulWidget {
  final String label;
  final VoidCallback onConfirmed;

  const SlideToAct({super.key, this.label = 'Get Started', required this.onConfirmed});

  @override
  State<SlideToAct> createState() => _SlideToActState();
}

class _SlideToActState extends State<SlideToAct> with SingleTickerProviderStateMixin {
  double _dragPosition = 0;
  bool _isComplete = false;

  static const double _thumbSize = 52;
  static const double _padding = 6;
  static const double _trackH = 64;

  late AnimationController _snapController;
  late Animation<double> _snapAnim;

  @override
  void initState() {
    super.initState();
    _snapController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _snapController.dispose();
    super.dispose();
  }

  void _snapBack() {
    _snapAnim = Tween<double>(begin: _dragPosition, end: 0).animate(
      CurvedAnimation(parent: _snapController, curve: Curves.easeOut),
    )..addListener(() => setState(() => _dragPosition = _snapAnim.value));
    _snapController
      ..reset()
      ..forward();
  }

  void _onDragUpdate(DragUpdateDetails details, double trackWidth) {
    if (_isComplete) return;
    final maxOffset = trackWidth - _thumbSize - _padding * 2;
    setState(() {
      _dragPosition = ((_dragPosition * maxOffset + details.delta.dx) / maxOffset).clamp(0.0, 1.0);
    });
    if (_dragPosition >= 0.95) _onComplete();
  }

  void _onDragEnd(DragEndDetails _) {
    if (!_isComplete) _snapBack();
  }

  void _onComplete() {
    widget.onConfirmed.call();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = constraints.maxWidth;
        final maxOffset = trackWidth - _thumbSize - _padding * 2;
        final thumbLeft = _padding + _dragPosition * maxOffset;

        return GestureDetector(
          onHorizontalDragUpdate: (d) => _onDragUpdate(d, trackWidth),
          onHorizontalDragEnd: _onDragEnd,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_trackH / 2),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.5),
                width: 0.35,
              )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_trackH / 2),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: SizedBox(
                  height: _trackH,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: _dragPosition,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(_trackH / 2),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Opacity(
                          opacity: (1 - _dragPosition * 1.5).clamp(0.0, 1.0),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.label,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.chevron_right, color: Colors.white, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: _snapController.isAnimating
                            ? const Duration(milliseconds: 300)
                            : Duration.zero,
                        curve: Curves.easeOut,
                        left: thumbLeft,
                        top: _padding,
                        child: Container(
                          width: _thumbSize,
                          height: _thumbSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            _isComplete ? Icons.check_circle : Icons.keyboard_double_arrow_right,
                            color: Colors.grey.shade600,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
