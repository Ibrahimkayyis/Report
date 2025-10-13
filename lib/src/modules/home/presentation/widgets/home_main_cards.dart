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
            onTap: () {
              context.pushRoute(const ServiceRequestSelectionRoute());
            },
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
      height: 180.h, // Increased height for better text spacing
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
          
          // Subtitle with flexible space
          Expanded(
            flex: 3, // Give more space to subtitle
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 10.sp, 
                color: ColorName.onPrimary,
                height: 1.3, // Line height for better readability
              ),
              maxLines: 3, // Allow up to 3 lines
              overflow: TextOverflow.ellipsis, // Handle overflow gracefully
            ),
          ),
          
          SizedBox(height: 12.h),
          
          // Button with icon and text
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.onPrimary, width: 1.5.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.onPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  
                  SizedBox(width: 4.w),
                  
                  Icon(
                    Icons.add,
                    color: ColorName.onPrimary,
                    size: 14.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}