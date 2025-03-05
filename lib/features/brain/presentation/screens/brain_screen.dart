import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/features/brain/presentation/widgets/point_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Theming/colors.dart';

class BrainScreen extends StatelessWidget {
  const BrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Brain'),
      //   backgroundColor: Colors.white,
      //   surfaceTintColor: Colors.white,
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/btain.jpg',
              width: 600.w,
              height: 600.h,
            ),
          ),
          Positioned(
            top: 150.h,
            left: 170.w,
            child: const PointInBrain(
              num: '1',
            ),
          ),
          Positioned(
            top: 220.h,
            left: 100.w,
            child: const PointInBrain(
              num: '2',
            ),
          ),
          Positioned(
            top: 220.h,
            left: 240.w,
            child: const PointInBrain(
              num: '3',
            ),
          ),
          Positioned(
            top: 300.h,
            left: 170.w,
            child: const PointInBrain(
              num: '4',
            ),
          ),
          Positioned(
            top: 370.h,
            left: 270.w,
            child: const PointInBrain(
              num: '5',
            ),
          ),
          Positioned(
            top: 370.h,
            left: 80.w,
            child: const PointInBrain(
              num: '6',
            ),
          ),
          Positioned(
            top: 420.h,
            left: 170.w,
            child: const PointInBrain(
              num: '7',
            ),
          ),
          Positioned(
            top: 510.h,
            left: 170.w,
            child: const PointInBrain(
              num: '8',
            ),
          ),
          Positioned(
            top: 600.h,
            left: 40.w,
            child: Container(
              width: 300.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: ColorsApp.grey500.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  const GapH(height: 10),
                  Row(
                    children: [
                      const GapW(width: 50),
                      PointInBrainInfo(
                        colorIcon: Colors.blue.withOpacity(0.9),
                      ),
                      const GapW(width: 50),
                      Text(
                        'active',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24)
                      )
                    ],
                  ),
                  const GapH(height: 10),
                  Row(
                    children: [
                      const GapW(width: 50),
                      PointInBrainInfo(
                        colorIcon: Colors.red.withOpacity(0.9),
                      ),
                      const GapW(width: 50),
                      Text(
                        'disactive',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24)

                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
