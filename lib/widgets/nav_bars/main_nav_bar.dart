import 'package:flutter/material.dart';
import 'package:glass_flutter/widgets/containers/glass_container.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({
    super.key,
    this.onChanged,
    this.controller,
  });

  final ValueChanged<int>? onChanged;
  final PageController? controller;

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  final _height = 50.0;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      final pageIndex = widget.controller?.page ?? 0;
      if (pageIndex % 1 == 0 && pageIndex != _selectedIndex) {
        setState(() {
          _selectedIndex = pageIndex.round();
        });
      }
    });
  }

  void onChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: _height,
      child: GlassContainer(
        width: double.infinity,
        padding: EdgeInsetsGeometry.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {
                  onChange(0);
                },
                icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.white : Colors.black),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  onChange(1);
                },
                icon: Icon(
                  Icons.confirmation_num,
                  color: _selectedIndex == 1 ? Colors.white : Colors.black,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  onChange(2);
                },
                icon: Icon(Icons.person, color: _selectedIndex == 2 ? Colors.white : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
