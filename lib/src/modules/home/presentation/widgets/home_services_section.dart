import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.services,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorName.textPrimary,
          ),
        ),
        
        SizedBox(height: 16.h),
        
        // Services items with custom spacing
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Knowledge Base
            _ServiceItem(
              icon: Icons.folder,
              iconColor: Colors.orange.shade700,
              title: t.app.knowledge_base,
              onTap: () {},
            ),
            
            SizedBox(width: 32.w), // Reduced spacing between items
            
            // Check Report Status  
            _ServiceItem(
              icon: Icons.assignment,
              iconColor: ColorName.onPrimary,
              title: t.app.check_report_status,
              onTap: () {},
            ),
            
            // Add spacer to push items to the left
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const _ServiceItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70.w, // Fixed width for consistent layout
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: ColorName.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon, 
                color: iconColor, 
                size: 35.sp,
              ),
            ),
            
            SizedBox(height: 8.h),
            
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                color: ColorName.textPrimary,
                fontWeight: FontWeight.bold, // Changed to bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}