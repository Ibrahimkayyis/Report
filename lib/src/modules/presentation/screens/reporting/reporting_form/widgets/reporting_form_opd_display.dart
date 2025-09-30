import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class ReportingFormOpdDisplay extends StatelessWidget {
  final String opdName;
  final IconData opdIcon;
  final Color opdColor;

  const ReportingFormOpdDisplay({
    super.key,
    required this.opdName,
    required this.opdIcon,
    required this.opdColor,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.send_report_to,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: ColorName.primary,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: opdColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(opdIcon, color: Colors.white, size: 16.sp),
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Text(
                  opdName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorName.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
