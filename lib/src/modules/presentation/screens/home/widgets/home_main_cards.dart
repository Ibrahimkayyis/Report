import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';

class HomeMainCards extends StatelessWidget {
  const HomeMainCards({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Row(
      children: [
        Expanded(
          child: _MainCard(
            title: t.app.online_reporting,
            subtitle: t.app.online_reporting_subtitle,
            buttonText: t.app.create_report,
            onTap: () {
              context.pushRoute(const OpdSelectionRoute());
            },
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _MainCard(
            title: t.app.service_request,
            subtitle: t.app.service_request_subtitle,
            buttonText: t.app.create_request,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _MainCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const _MainCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: ColorName.primary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.textPrimary.withOpacity(0.1),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.onPrimary,
            ),
          ),

          SizedBox(height: 8.h),

          // Subtitle (tetap bisa wrap, tidak overflow)
          Expanded(
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 10.sp,
                color: ColorName.onPrimary,
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: 8.h),

          // OutlinedButton bawaan Flutter
          SizedBox(
            width: double.infinity,
            height: 32.h, // biar konsisten tinggi tombol
            child: OutlinedButton.icon(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: ColorName.onPrimary, width: 1.5.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                foregroundColor: ColorName.onPrimary,
              ),
              icon: Icon(Icons.add, size: 14.sp, color: ColorName.onPrimary),
              label: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.onPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
