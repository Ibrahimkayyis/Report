import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart'; 


class TeknisiTabBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTabSelected;
  final VoidCallback onRefresh;

  const TeknisiTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              _buildTab(context, t.app.dashboard.reportTab, 0),
              SizedBox(width: 24.w),
              _buildTab(context, t.app.dashboard.serviceTab, 1),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: onRefresh,
          // icon: Icon(Icons.refresh, size: 14.sp),
          label: Text(t.app.dashboard.refresh),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.primary,
            foregroundColor: ColorName.white,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(BuildContext context, String label, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? ColorName.primary : Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 3.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: isSelected ? ColorName.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}
