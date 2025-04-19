import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BinarySignalData extends StatefulWidget {
  const BinarySignalData({super.key});

  @override
  State<BinarySignalData> createState() => _BinarySignalDataState();
}

class _BinarySignalDataState extends State<BinarySignalData> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> brainSignalData = [
    {
      'title': 'Seizure',
      'description': 'Sudden bursts of rapid, repetitive electrical activity.',
      'Possible diseases': 'Epilepsy, brain injury, infections, tumors.',
      'Treatment': 'Anti-seizure medications, surgery, lifestyle changes.',
    },
    {
      'title': 'LPD',
      'description':
          'Repeating spikes from one side of the brain at regular intervals.',
      'Possible diseases': 'Stroke, brain infections, tumors, epilepsy.',
      'Treatment':
          'Treat underlying cause (infection/stroke), anti-seizure meds if needed.',
    },
    {
      'title': 'GPD',
      'description':
          'Repeating spikes from both sides of the brain simultaneously.',
      'Possible diseases':
          'Brain damage, coma, severe metabolic issues, encephalopathy.',
      'Treatment': 'Supportive care, treat root causes (toxins, infections).',
    },
    {
      'title': 'LRDA',
      'description': 'Slow, rhythmic waves from one side of the brain.',
      'Possible diseases': 'Stroke, tumors, trauma, seizures.',
      'Treatment':
          'Focus on underlying brain problem; seizure meds may be used.',
    },
    {
      'title': 'GRDA',
      'description': 'Slow rhythmic waves from both sides of the brain.',
      'Possible diseases':
          'Encephalopathy, coma, deep sleep state, brain dysfunction.',
      'Treatment':
          'Treat underlying condition (infection/metabolic issue), supportive care.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 75.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brainSignalData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? ColorsApp.primary.withAlpha(800)
                              : Colors.grey.withAlpha(900),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedIndex == index
                                ? ColorsApp.primary.withAlpha(900)
                                : Colors.grey.withAlpha(900),
                            width: 2.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            brainSignalData[index]['title'],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? ColorsApp.primary.withAlpha(900)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14, // Adjust as needed
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description :',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primary,
                ),
              ),
              const GapH(height: 8),
              Text(
                brainSignalData[selectedIndex]['description'],
                style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorsApp.grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Possible diseases :',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primary,
                ),
              ),
              const GapH(height: 8),
              Text(
                brainSignalData[selectedIndex]['Possible diseases'],
                style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorsApp.grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Treatment :',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primary,
                ),
              ),
              const GapH(height: 8),
              Text(
                brainSignalData[selectedIndex]['Treatment'],
                style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorsApp.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
