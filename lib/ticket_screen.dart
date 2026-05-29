import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:glass_flutter/widgets/containers/glass_container.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  final List<String> titles = const [
    'Unlimited flights',
    'Arrive 15 minutes before departure',
    'No terminals. Just private lounges',
    'No commitment. Total control',
  ];

  final List<IconData> icons = const [
    Icons.flight_takeoff_rounded,
    Icons.account_circle_outlined,
    Icons.account_circle_outlined,
    Icons.account_circle_outlined,
  ];

  final List<String> contents = const [
    'Enjoy unlimited flights with a fixed monthly price. Absolutely no hidden charges, no surprises.',
    'Arrive a mere 15 minutes before departure at our exclusive private terminal. Say goodbye to busy terminals and lengthy lines.',
    'Travel in style from our private terminal lounges. Indulge in a selection of carefully chosen healthy snacks and beverages for a refined experience.',
    'Benefit from our membership\'s monthly payments. Cancel anytime to stop auto-renewal if unsatisfied. No lock-in contracts, no risk',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF100F0F), Color(0xFF1F1F1F)],
        ),
      ),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: GlassContainer(
                      width: double.infinity,
                      borderRadius: 100,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                      child: Row(
                        spacing: 4,
                        children: [
                          Transform.rotate(
                            angle: -math.pi / -2,
                            child: Icon(Icons.airplanemode_active_rounded, color: Colors.white),
                          ),
                          Expanded(
                            child: Text(
                              '0 of 0 available',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Tap to book',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GlassContainer(
                    width: 60,
                    borderRadius: 100,
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16),
              GlassContainer(
                width: double.infinity,
                padding: EdgeInsets.zero,
                borderRadius: 24,
                child: Image.asset('assets/images/interior.jpeg', fit: BoxFit.cover),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Tour the plane >',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) {
                    return SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    return GlassContainer(
                      width: 200,
                      child: Column(
                        spacing: 8,
                        children: [
                          Row(
                            children: [
                              Icon(
                                icons[index],
                                color: Colors.white,
                                size: 40,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  titles[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            contents[index],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  icon: Icon(
                    Icons.app_registration,
                    color: Colors.black,
                    size: 24,
                  ),
                  label: Text(
                    'Pre-order now',
                    style: TextStyle(color: Colors.black87),
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
