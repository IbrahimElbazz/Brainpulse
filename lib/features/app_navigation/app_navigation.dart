import 'package:brain_pulse/features/brain/presentation/screens/brain_screen.dart';
import 'package:brain_pulse/features/history/presentation/screens/history.dart';
import 'package:brain_pulse/features/home/presentation/screens/home_screen.dart';
import 'package:brain_pulse/features/more/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const BrainScreen(),
    const History(),
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
          color: Colors.blue,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/brain.svg',
          fit: BoxFit.scaleDown,
          width: 50.w,
        ),
        label: 'Brain',
        activeIcon: SvgPicture.asset(
          'assets/svgs/brain.svg',
          color: Colors.blue,
          fit: BoxFit.scaleDown,
          width: 50.w,
        ),
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          color: Colors.black,
          Icons.history_sharp,
          size: 28,
        ),
        label: 'history',
        activeIcon: Icon(
          Icons.history_sharp,
          size: 28,
        ),
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          color: Colors.black,
          Icons.more_horiz,
          size: 28,
        ),
        label: 'more',
        activeIcon: Icon(
          color: Colors.blue,
          Icons.more_horiz,
          size: 28,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
