import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_state.dart';
import '../widgets/activity_item.dart';

// ✅ Import Shimmer
import '../widgets/shimmer/activity_list_shimmer.dart'; 

@RoutePage()
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // ... (kode state lainnya tetap sama) ...
  int _currentPage = 1;
  final int _itemsPerPage = 5;
  String? _userRole;

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  Future<void> _fetchUserRole() async {
    final role = await sl<AuthRepository>().getSavedRole();
    setState(() {
      _userRole = role?.toLowerCase();
    });
  }

  List<ActivityModel> _getPaginatedData(List<ActivityModel> allData) {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    if (startIndex >= allData.length) return [];

    return allData.sublist(
      startIndex,
      endIndex > allData.length ? allData.length : endIndex,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _navigateToDetail(String ticketId) async {
    if (!mounted) return;
    if (_userRole == 'masyarakat') {
      context.router.push(MasyarakatReportActivityDetailRoute(ticketId: ticketId));
    } else {
      context.router.push(ReportActivityDetailRoute(ticketId: ticketId));
    }
  }

  Future<void> _navigateToReopen(BuildContext context, String ticketId) async {
    final result = await (_userRole == 'masyarakat'
        ? context.router.push(MasyarakatReopenTicketRoute(ticketId: ticketId))
        : context.router.push(ReopenTicketRoute(ticketId: ticketId)));
    
    if (result == true) {
      if (context.mounted) {
        context.read<ReportActivityCubit>().getActivities();
      }
    }
  }

  Future<void> _navigateToRating(BuildContext context, String ticketId) async {
    final result = await context.router.push(TicketRatingRoute(ticketId: ticketId));
    
    if (result == true) {
      if (context.mounted) {
        context.read<ReportActivityCubit>().getActivities();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ReportActivityCubit>()..getActivities(),
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: const AppSecondaryBar(title: "Riwayat Laporan"),
        body: SafeArea(
          child: BlocBuilder<ReportActivityCubit, ReportActivityState>(
            builder: (context, state) {
              
              // ✅ GANTI LOADING STATE DI SINI
              if (state is ReportActivityLoading) {
                return const ActivityListShimmer();
              } 
              
              else if (state is ReportActivityError) {
                return AppErrorState.general(
                  context: context,
                  message: state.message,
                  onRetry: () => context.read<ReportActivityCubit>().getActivities(),
                );
              } else if (state is ReportActivityEmpty) {
                return AppEmptyState.list(
                  context: context,
                  message: "Belum ada riwayat laporan yang selesai.",
                  onRefresh: () => context.read<ReportActivityCubit>().getActivities(),
                );
              } else if (state is ReportActivityLoaded) {
                final allActivities = state.activities;
                final currentActivities = _getPaginatedData(allActivities);
                final totalPages = (allActivities.length / _itemsPerPage).ceil();
                final startData = ((_currentPage - 1) * _itemsPerPage) + 1;
                final endData = (_currentPage * _itemsPerPage) > allActivities.length
                    ? allActivities.length
                    : (_currentPage * _itemsPerPage);

                return Column(
                  children: [
                    // Content List
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await context.read<ReportActivityCubit>().getActivities();
                          if (mounted) _onPageChanged(1);
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: currentActivities.length,
                          itemBuilder: (context, index) {
                            final activity = currentActivities[index];

                            final statusLower = activity.status.toLowerCase();
                            final isFinished = statusLower == 'selesai';
                            final canReopen = isFinished;
                            final hasRated = activity.rating != null;
                            final canRate = isFinished && !hasRated;

                            return ActivityItem(
                              activity: activity,
                              onViewHistory: () => _navigateToDetail(activity.id),
                              onReopen: canReopen 
                                  ? () => _navigateToReopen(context, activity.id) 
                                  : null,
                              onRate: canRate 
                                  ? () => _navigateToRating(context, activity.id) 
                                  : null,
                            );
                          },
                        ),
                      ),
                    ),

                    // Pagination
                    if (allActivities.isNotEmpty) ...[
                      Divider(height: 1.h, color: ColorName.black.withOpacity(0.1)),
                      Container(
                        color: ColorName.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: AppPagination(
                          currentPage: _currentPage,
                          totalPages: totalPages,
                          totalData: allActivities.length,
                          startData: startData,
                          endData: endData,
                          onPageSelected: _onPageChanged,
                          onNext: _currentPage < totalPages 
                              ? () => _onPageChanged(_currentPage + 1) 
                              : null,
                          onPrevious: _currentPage > 1 
                              ? () => _onPageChanged(_currentPage - 1) 
                              : null,
                        ),
                      ),
                    ],
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}