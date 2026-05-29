import 'package:flutter/material.dart';
import 'package:glass_flutter/home_screen.dart';
import 'package:glass_flutter/profile_screen.dart';
import 'package:glass_flutter/ticket_screen.dart';
import 'package:glass_flutter/widgets/nav_bars/main_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavBar(
        controller: pageController,
        onChanged: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        },
      ),
      extendBody: true,
      body: PageView(
        controller: pageController,
        children: [HomeScreen(), TicketScreen(), ProfileScreen()],
      ),
    );
  }
}
