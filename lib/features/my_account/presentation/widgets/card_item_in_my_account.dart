import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardItemInMyAccount extends StatelessWidget {
  const CardItemInMyAccount({
    required this.icon,
    required this.title,
    required this.subTitle,
    this.colorBackgroundIcon,
    this.onTap,
    this.titleColor,
    super.key,
    this.isLogout,
  });

  final String icon;
  final Color? colorBackgroundIcon;
  final String title;
  final Color? titleColor;
  final String subTitle;
  final void Function()? onTap;
  final bool? isLogout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Container(
              width: 48.w,
              height: 48.h,
              decoration: ShapeDecoration(
                color: colorBackgroundIcon ?? const Color(0xFFEFFEFC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.r),
                ),
              ),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.scaleDown,
              ),
            ),
            const GapW(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor ?? const Color(0xFF1D2035),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const GapH(height: 4),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: const Color(0xFF9DA1A6),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (isLogout == true)
              const SizedBox.shrink()
            else
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
