import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({super.key, required this.prediction});
  final Map<String, dynamic> prediction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'result',
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'predicted Class :     ',
                     style: Theme.of(context).textTheme.bodyLarge,

        ),
                  Text(
                    prediction['predictedClass'],
                    style: Theme.of(context).textTheme.bodyLarge,

                  ),
                ],
              ),
              gapH(20),
              Row(
                children: [
                  Text(
                    'gpd : ',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  Text(
                    prediction['gpd'],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'grda : ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    prediction['grda'],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'lpd : ',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  Text(
                    prediction['lpd'],
                    style: Theme.of(context).textTheme.bodyLarge,

                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'lrda : ',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  Text(
                    prediction['lrda'],
                    style: Theme.of(context).textTheme.bodyLarge,

                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'seizure : ',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  Text(
                    prediction['seizure'],
                    style: Theme.of(context).textTheme.bodyLarge,

                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'other : ',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  Text(
                    prediction['other'],
                    style: Theme.of(context).textTheme.bodyLarge,

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
