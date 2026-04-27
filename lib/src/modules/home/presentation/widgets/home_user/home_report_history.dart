import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_state.dart';
import 'package:report/src/modules/report_activity/presentation/widgets/activity_item.dart';

// ✅ Import Shimmer Widget
import 'shimmer/home_report_history_shimmer.dart';

class HomeReportHistory extends StatelessWidget {
  const HomeReportHistory({super.key});

  // Logic Navigasi ke Detail
  Future<void> _navigateToDetail(BuildContext context, String ticketId) async {
    final role = await sl<AuthRepository>().getSavedRole();
    final userRole = role?.toLowerCase();

    if (!context.mounted) return;

    if (userRole == 'masyarakat') {
      context.router.push(MasyarakatReportActivityDetailRoute(ticketId: ticketId));
    } else {
      context.router.push(ReportActivityDetailRoute(ticketId: ticketId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Header Title (Tanpa Button Lihat Semua)
        Text(
          t.app.report_history,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorName.textPrimary,
          ),
        ),
        
        SizedBox(height: 12.h),
        
        // BlocBuilder untuk Data Real
        BlocBuilder<ReportActivityCubit, ReportActivityState>(
          builder: (context, state) {
            
            // ✅ GANTI LOADING STATE DI SINI
            if (state is ReportActivityLoading) {
              return const HomeReportHistoryShimmer();
            } 
            
            else if (state is ReportActivityLoaded) {
              final activities = state.activities;

              if (activities.isEmpty) {
                return _buildEmptyState(t);
              }

              // Ambil Max 2 Data Terbaru
              final latestActivities = activities.take(2).toList();

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: latestActivities.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final activity = latestActivities[index];

                  return ActivityItem(
                    activity: activity,
                    onViewHistory: () => _navigateToDetail(context, activity.id),
                    // Nonaktifkan tombol aksi cepat di Home agar tidak terlalu padat
                    onReopen: null, 
                    onRate: null,
                  );
                },
              );
            } 
            
            else if (state is ReportActivityError) {
              return Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                   color: Colors.red.shade50,
                   borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "Gagal memuat riwayat: ${state.message}",
                  style: TextStyle(color: Colors.red, fontSize: 12.sp),
                ),
              );
            }

            return _buildEmptyState(t);
          },
        ),
      ],
    );
  }

  Widget _buildEmptyState(dynamic t) {
    return Container(
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
            color: ColorName.black.withValues(alpha: 0.05),
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
    );
  }
}