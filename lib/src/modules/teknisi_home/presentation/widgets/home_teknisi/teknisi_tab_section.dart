import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_tab_bar.dart';

/// Section besar berisi TabBar, Filter, Ticket List, dan Pagination.
/// UI-only: semua data & state dikendalikan oleh parent (HomeTeknisiScreen).
class TeknisiTabSection extends StatelessWidget {
  final int selectedTabIndex;
  final VoidCallback onRefresh;
  final void Function(int) onTabSelected;
  final Widget filterCard;
  final Widget ticketList;
  final Widget pagination;

  const TeknisiTabSection({
    super.key,
    required this.selectedTabIndex,
    required this.onRefresh,
    required this.onTabSelected,
    required this.filterCard,
    required this.ticketList,
    required this.pagination,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          TeknisiTabBar(
            selectedIndex: selectedTabIndex,
            onTabSelected: onTabSelected,
            onRefresh: onRefresh,
          ),
          SizedBox(height: 20.h),
          filterCard,
          SizedBox(height: 20.h),
          ticketList,
          SizedBox(height: 12.h),
          pagination,
        ],
      ),
    );
  }
}
