import 'package:flutter/material.dart';

import '../animations/flight_animation.dart';

class FlightContent extends StatefulWidget {
  const FlightContent({super.key});

  @override
  State<FlightContent> createState() => _FlightContentState();
}

class _FlightContentState extends State<FlightContent> with SingleTickerProviderStateMixin {
  late AnimationController _controllerText;

  @override
  void initState() {
    super.initState();
    _controllerText = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlightAnimation(
          duration: Duration(seconds: 3),
        ),
        FlightAnimation(
          duration: Duration(seconds: 2),
        ),
      ],
    );
  }
}
