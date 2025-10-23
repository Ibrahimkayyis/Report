import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class HomeReportHistory extends StatelessWidget {
  const HomeReportHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.report_history,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorName.textPrimary,
          ),
        ),
        
        SizedBox(height: 16.h),
        
        // Container with empty state
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorName.black.withOpacity(0.05),
                blurRadius: 4.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.grey.shade500,
                size: 20.sp,
              ),
              
              SizedBox(width: 12.w),
              
              Expanded(
                child: Text(
                  t.app.no_report_history,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                    height: 1.4,
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