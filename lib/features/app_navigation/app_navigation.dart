import 'package:brain_pulse/features/more/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const More(),
    const More(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/svgs/home-2.svg'),
        label: 'home',
        activeIcon: SvgPicture.asset(
          'assets/svgs/home-2.svg',
          color: Colors.grey,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/svgs/home-2.svg'),
        label: 'later',
        activeIcon: SvgPicture.asset(
          'assets/svgs/home-2.svg',
          color: Colors.grey,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/svgs/home-2.svg'),
        label: 'more',
        activeIcon: SvgPicture.asset(
          'assets/svgs/home-2.svg',
          color: Colors.grey,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
