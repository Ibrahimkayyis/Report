import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback? onCalendarTap;

  const HomeHeader({
    super.key,
    this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: ColorName.background,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Logo di kiri
              Image.asset(
                Assets.images.logoText.path,
                height: 36.h,
                fit: BoxFit.contain,
                semanticLabel: 'REPORT Logo Text',
              ),

              // 🔹 Icon Calendar
              GestureDetector(
                onTap: onCalendarTap,
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: ColorName.background,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ColorName.black.withOpacity(0.08),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.calendar_month_rounded,
                    color: ColorName.primary,
                    size: 22.sp,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 4.h),

        // Thin divider like AppBar
        Divider(
          height: 0.5,
          thickness: 0.5,
          color: Colors.grey.shade600,
        ),
      ],
    );
  }
}
