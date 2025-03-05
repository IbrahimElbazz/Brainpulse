import 'package:brain_pulse/core/Theming/colors.dart';
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
        backgroundColor: ColorsApp.white,
        icon: SvgPicture.asset('assets/svgs/home-2.svg',
            color: Theme.of(context).iconTheme.color          ),
        label: 'Home',
        activeIcon: SvgPicture.asset(
          'assets/svgs/home-2.svg',
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: ColorsApp.white,
        icon: SvgPicture.asset(
          color: Theme.of(context).iconTheme.color,          'assets/svgs/brain.svg',
          fit: BoxFit.scaleDown,
          width: 50.w,
        ),
        label: 'Brain',
        activeIcon: SvgPicture.asset(
          'assets/svgs/brain.svg',
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          fit: BoxFit.scaleDown,
          width: 50.w,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: ColorsApp.white,
        icon:  Icon(
          color: Theme.of(context).iconTheme.color,
          Icons.history_sharp,
          size: 28,
        ),
        label: 'History',
        activeIcon: const Icon(
          Icons.history_sharp,
          size: 28,
        ),
      ),
       BottomNavigationBarItem(
        backgroundColor: ColorsApp.white,
        icon:  Icon(
          color: Theme.of(context).iconTheme.color,
          Icons.more_horiz,
          size: 28,
        ),
        label: 'More',
        activeIcon:  Icon(
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,          Icons.more_horiz,
          size: 28,
        ),
      ),
    ];
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _children[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor, // تعديل هنا
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                selectedIconTheme: Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
                unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                items: items,
                currentIndex: _currentIndex,
                selectedItemColor: Colors.blue,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ));
  }
}
