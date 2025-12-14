import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';
import 'package:report/src/modules/teknisi_rfc/presentation/cubits/rfc_cubit.dart';
import '../widgets/rfc_card_item.dart';

@RoutePage()
class RFCScreen extends StatefulWidget {
  const RFCScreen({super.key});

  @override
  State<RFCScreen> createState() => _RFCScreenState();
}

class _RFCScreenState extends State<RFCScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _mapStatus(RfcModel item) {
    if (item.ticketStatus != null && item.ticketStatus!.isNotEmpty) {
      return item.ticketStatus!;
    }
    return item.statusTrace ?? 'Menunggu review';
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    } catch (e) {
      return dateString;
    }
  }

  // ✅ Method untuk Handle Refresh
  void _handleRefresh() {
    context.read<RfcCubit>().fetchSubmittedRfcs();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Memuat ulang data...'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorName.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RfcCubit>()..fetchSubmittedRfcs(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppPrimaryBar(
          title: "Request For Change (RFC)",
          centerTitle: true,
        ),
        body: Column(
          children: [
            /// Header Section with Tambah & Refresh Button
            Container(
              color: ColorName.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                    child: Row(
                      children: [
                        // Tombol Tambah
                        InkWell(
                          onTap: () => context.router.push(RFCFormRoute()),
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: ColorName.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                    color: ColorName.primary,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: ColorName.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Tambah",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorName.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Tombol Refresh
                        BlocBuilder<RfcCubit, RfcState>(
                          builder: (context, state) {
                            final isLoading = state is RfcLoading;
                            
                            return InkWell(
                              onTap: isLoading ? null : _handleRefresh,
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color: ColorName.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: isLoading
                                    ? SizedBox(
                                        width: 18.sp,
                                        height: 18.sp,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            ColorName.primary,
                                          ),
                                        ),
                                      )
                                    : Icon(
                                        Icons.refresh_rounded,
                                        color: ColorName.primary,
                                        size: 20.sp,
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Tab Bar
                  TabBar(
                    controller: _tabController,
                    onTap: (index) => setState(() {}),
                    labelColor: ColorName.primary,
                    unselectedLabelColor: Colors.grey.shade600,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorColor: ColorName.primary,
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(text: "Insiden Berulang"),
                      Tab(text: "Permintaan Perubahan"),
                    ],
                  ),
                ],
              ),
            ),

            /// Content Area
            Expanded(
              child: BlocBuilder<RfcCubit, RfcState>(
                builder: (context, state) {
                  if (state is RfcLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RfcError) {
                    return Center(
                      child: AppErrorState.general(
                        context: context,
                        message: state.message,
                        onRetry: () =>
                            context.read<RfcCubit>().fetchSubmittedRfcs(),
                      ),
                    );
                  } else if (state is RfcLoaded) {
                    final allData = state.submittedRfcs;

                    // Filter Data
                    final incidentList = allData
                        .where((e) => e.type == RfcType.incidentRepeat)
                        .toList();

                    final changeRequestList = allData
                        .where((e) => e.type == RfcType.changeRequest)
                        .toList();

                    return TabBarView(
                      controller: _tabController,
                      children: [
                        // Tab 1: Insiden Berulang
                        _buildRfcList(
                          context, // ✅ Pass context dari BlocBuilder
                          incidentList,
                          "Tidak ada data Insiden Berulang",
                        ),

                        // Tab 2: Permintaan Perubahan
                        _buildRfcList(
                          context, // ✅ Pass context dari BlocBuilder
                          changeRequestList,
                          "Tidak ada data Permintaan Perubahan",
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Widget Reusable List - Terima BuildContext sebagai parameter
  Widget _buildRfcList(
    BuildContext context, // ✅ Tambahkan parameter context
    List<RfcModel> data,
    String emptyMessage,
  ) {
    if (data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.folder_open, size: 48.sp, color: Colors.grey.shade300),
            SizedBox(height: 12.h),
            Text(
              emptyMessage,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    // ✅ Gunakan context yang di-pass dari BlocBuilder
    return RefreshIndicator(
      onRefresh: () async {
        context.read<RfcCubit>().fetchSubmittedRfcs();
      },
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 80.h),
        itemCount: data.length,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final item = data[index];
          return RFCCardItem(
            documentName: item.judulPerubahan,
            dateSent: _formatDate(item.createdAt),
            status: _mapStatus(item),
            isDraft: false,
            onEditPressed: () {
              context.router.push(
                RFCDetailRoute(
                  localRfcId: item.localRfcId,
                  rfcType: item.type,
                ),
              );
            },
          );
        },
      ),
    );
  }
}