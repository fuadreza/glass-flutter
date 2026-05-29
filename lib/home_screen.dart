import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:glass_flutter/widgets/containers/glass_container.dart';
import 'package:glass_flutter/widgets/contents/flight_content.dart';

import 'chat_screen.dart';
import 'widgets/animations/plane_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controllerKeyboardPointer;
  late Animation<double> _animationKeyboardPointer;

  @override
  void initState() {
    super.initState();
    _controllerKeyboardPointer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controllerKeyboardPointer.repeat(reverse: true);
    _animationKeyboardPointer = CurvedAnimation(
      parent: _controllerKeyboardPointer,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controllerKeyboardPointer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF100F0F), Color(0xFF1F1F1F)],
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    spacing: 16,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/interior.jpeg',
                            fit: BoxFit.cover,
                            height: MediaQuery.heightOf(context),
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Container(color: Colors.black.withValues(alpha: 0.3)),
                            ),
                          ),
                          Positioned(
                            top: 200,
                            left: 0,
                            right: 0,
                            child: Text(
                              'Fly Freely',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 350,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 16,
                                children: [
                                  Text(
                                    'Unlimited private flights. One flat monthly price.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(horizontal: 16),
                                    child: FilledButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStateProperty.all(Colors.white),
                                        padding: WidgetStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 12),
                                        ),
                                      ),
                                      child: Text(
                                        'Pre-order now',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 150,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 16,
                                children: [
                                  Text(
                                    'Australia\'s first and only personal aviation',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  PlaneAnimation(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.heightOf(context),
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Flying commercial wastes more than 2 hours',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' on every Sydney-Melbourne round trip.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 21,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Yet with ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 21,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'private charters costing \$11,000 on-way',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ', most have left behind - ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 21,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'until now.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: FadeTransition(
                                      opacity: _animationKeyboardPointer,
                                      child: Text(
                                        '|',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.heightOf(context),
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: FlightContent()
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: [
                        Colors.black.withValues(alpha: 0.80),
                        Colors.black.withValues(alpha: 0.70),
                        Colors.black.withValues(alpha: 0.5),
                        Colors.black.withValues(alpha: 0.35),
                        Colors.black.withValues(alpha: 0.0),
                      ],
                      stops: const [0.0, 0.2, 0.6, 0.8, 1.0],
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            OpenContainer(
                              transitionType: ContainerTransitionType.fadeThrough,
                              transitionDuration: Duration(milliseconds: 500),
                              openColor: Colors.black.withValues(alpha: 0.1),
                              openElevation: 1,
                              closedElevation: 0,
                              closedShape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(0)),
                              ),
                              closedColor: Colors.transparent,
                              middleColor: Colors.transparent,
                              closedBuilder: (BuildContext context, VoidCallback openContainer) {
                                return GestureDetector(
                                  onTap: openContainer,
                                  child: GlassContainer(
                                    width: 60,
                                    borderRadius: 100,
                                    child: Icon(Icons.chat_outlined, color: Colors.white),
                                  ),
                                );
                              },
                              openBuilder: (BuildContext context, VoidCallback closeContainer) {
                                return ChatScreen(closeContainer: closeContainer);
                              },
                            ),
                            Expanded(child: Icon(Icons.abc, color: Colors.white, size: 50)),
                            GlassContainer(
                              width: 80,
                              borderRadius: 100,
                              padding: EdgeInsetsGeometry.symmetric(vertical: 16, horizontal: 8),
                              child: Text(
                                'Pre-order',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Icon(Icons.menu, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
