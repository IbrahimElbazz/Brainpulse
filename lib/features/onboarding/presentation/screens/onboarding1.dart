import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/board1.png'),
                const SizedBox(height: 50),
                Text(
                  'Welcome to Brain pulse',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 382.w,
                  child: Text(
                    'A smart tool that makes medical diagnosis easy and fast',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF637D92),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
