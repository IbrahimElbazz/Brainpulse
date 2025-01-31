import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.grey.withOpacity(0.05),
        ),
        child: ListTile(
          title: const Text('name'),
          subtitle: const Text('01000000000'),
          leading: Container(
            width: 35.w,
            height: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(555.r),
              color: Colors.blue.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // How much the shadow spreads
                  blurRadius: 5, // How blurry the shadow is
                  offset: const Offset(0, 3), // Offset of the shadow (x, y)
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
