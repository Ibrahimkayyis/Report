import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          t.app.services,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorName.textPrimary,
          ),
        ),

        SizedBox(height: 16.h),

        // Services items
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Knowledge Base
            _ServiceItem(
              imagePath: Assets.icons.knowledgeBase.path,
              title: t.app.knowledge_base,
              onTap: () => context.router.push(const KnowledgeBaseRoute()),
            ),

            SizedBox(width: 32.w),

            // Check Report Status
            _ServiceItem(
              imagePath: Assets.icons.reportStatus.path,
              title: t.app.check_report_status,
              onTap: () => context.router.push(const CheckReportStatusRoute()),
            ),

            const Spacer(),
          ],
        ),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const _ServiceItem({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70.w,
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: ColorName.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset(
                  imagePath,
                  color: Colors.white, // 🔥 Putih agar kontras dengan primary
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                color: ColorName.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
