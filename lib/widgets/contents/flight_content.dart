import 'dart:async';

import 'package:flutter/material.dart';

import '../animations/flight_animation.dart';

class FlightContent extends StatefulWidget {
  const FlightContent({super.key});

  @override
  State<FlightContent> createState() => _FlightContentState();
}

class _FlightContentState extends State<FlightContent> with SingleTickerProviderStateMixin {
  final ValueNotifier<int> minutes1 = ValueNotifier(0);
  final ValueNotifier<int> minutes2 = ValueNotifier(0);
  late Timer timer1;
  late Timer timer2;

  @override
  void initState() {
    super.initState();
    timer1 = Timer.periodic(Duration(milliseconds: 8), (timer) {
      minutes1.value = (minutes1.value + 1);
      if (minutes1.value >= 204) {
        timer1.cancel();
      }
    });
    timer2 = Timer.periodic(Duration(milliseconds: 8), (timer) {
      minutes2.value = (minutes1.value + 1);
      if (minutes1.value >= 142) {
        timer2.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer1.cancel();
    timer2.cancel();
    minutes1.dispose();
    minutes2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How long does it really take?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Sydney to Melbourne - curb to curb, your time preserved',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            'Airlines',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          FlightAnimation(
            duration: Duration(seconds: 3),
          ),
          SizedBox(
            width: double.infinity,
            child: ValueListenableBuilder(
              valueListenable: minutes1,
              builder: (context, value, child) {
                return Text(
                  '$value minutes',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'BLACK JET',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          FlightAnimation(
            duration: Duration(seconds: 2),
          ),
          SizedBox(
            width: double.infinity,
            child: ValueListenableBuilder(
              valueListenable: minutes2,
              builder: (context, value, child) {
                return Text(
                  '$value minutes',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
