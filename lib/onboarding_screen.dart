import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_flutter/widgets/sliders/slide_to_act.dart';

import 'main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/plane4.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 150, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  Text(
                    'Embark On An Adventure With Us',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Discover new horizons and unforgettable experiences with our travel app. Your journey starts here.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              width: double.infinity,
              child: SlideToAct(
                onConfirmed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
