import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';
import 'package:report/src/modules/notification/presentation/cubits/notification_detail_cubit.dart';
import 'package:report/src/modules/notification/presentation/cubits/notification_detail_state.dart';

@RoutePage()
class NotificationDetailScreen extends StatelessWidget {
  final String id;

  const NotificationDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NotificationDetailCubit>()..fetchDetail(id),
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: const AppPrimaryBar(title: "Detail Notifikasi"),
        body: BlocBuilder<NotificationDetailCubit, NotificationDetailState>(
          builder: (context, state) {
            if (state is NotificationDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationDetailError) {
              return AppErrorState.general(
                context: context,
                message: state.message,
                onRetry: () => context.read<NotificationDetailCubit>().fetchDetail(id),
              );
            } else if (state is NotificationDetailLoaded) {
              return _buildContent(context, state.detail);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, NotificationDetailModel detail) {
    final serviceTypeFormatted = detail.requestType.replaceAll('_', ' ').toUpperCase();
    final opdName = detail.opdName.isNotEmpty ? detail.opdName : '-';
    final status = detail.statusTicket.isNotEmpty ? detail.statusTicket : 'Unknown';
    final ticketCode = detail.ticketCode.isNotEmpty ? detail.ticketCode : '-';

    String mainTitle = "Informasi Tiket";
    if (detail.message.toLowerCase().contains("berubah") || detail.requestType.contains("update")) {
      mainTitle = "Status Tiket Diperbarui";
    } else if (detail.requestType.contains("ticket")) {
      mainTitle = "Tiket Dibuat";
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER TITLE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainTitle,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorName.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildTag("Status"),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                detail.createdAt,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                textAlign: TextAlign.right,
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // MAIN CARD
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(Icons.assignment_turned_in, size: 48.sp, color: ColorName.primary),
                SizedBox(height: 16.h),

                Text(
                  mainTitle,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorName.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pengaduan Anda:",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                  ),
                ),

                SizedBox(height: 12.h),

                // ======================================
                //   🔥 ROW BARU: Ticket No + COPY BUTTON
                // ======================================
                _buildTicketInfoRowWithCopy(
                  context,
                  label: "No. Tiket",
                  value: ticketCode,
                ),

                SizedBox(height: 12.h),

                // STATUS
                _buildTicketInfoRow("Status", status, isStatusBadge: true),

                SizedBox(height: 24.h),
                Divider(color: Colors.grey.shade200),
                SizedBox(height: 24.h),

                // JENIS LAYANAN & OPD
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildDetailColumn(
                        icon: Icons.assignment,
                        label: "Jenis Layanan:",
                        value: serviceTypeFormatted,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _buildDetailColumn(
                        icon: Icons.domain,
                        label: "OPD Tujuan:",
                        value: opdName,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 32.h),

          // FOOTER MESSAGE
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.build_circle_outlined, size: 24.sp, color: Colors.grey.shade700),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informasi Terkini",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorName.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    Text(
                      detail.message,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorName.textPrimary.withOpacity(0.8),
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    _buildSmallInfoRow("Jenis Layanan", serviceTypeFormatted),
                    _buildSmallInfoRow("OPD Tujuan", opdName),

                    SizedBox(height: 20.h),

                    if (detail.ticketCode.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          context.pushRoute(
                            CheckReportStatusRoute(),
                          );
                        },
                        child: Text(
                          "Cek Status Layanan",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorName.primary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  // ================================================================
  //   🔥 NEW WIDGET: Ticket Row with Copy Button
  // ================================================================
  Widget _buildTicketInfoRowWithCopy(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.textPrimary,
              ),
            ),
          ),
        ),

        SizedBox(width: 16.w),

        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1F4E79),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // COPY BUTTON
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: value));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("ID Tiket berhasil disalin"),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Icon(Icons.copy, size: 18.sp, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // BUILD HELPERS
  // ================================================================

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1F4E79),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildTicketInfoRow(String label, String value, {bool isBlueBadge = false, bool isStatusBadge = false}) {
    Color badgeColor = Colors.grey;
    Color textColor = Colors.white;

    if (isBlueBadge) {
      badgeColor = const Color(0xFF1F4E79);
    } else if (isStatusBadge) {
      final statusLower = value.toLowerCase();
      if (statusLower.contains('pending') || statusLower.contains('menunggu')) {
        badgeColor = const Color(0xFFFFC107);
        textColor = Colors.black87;
      } else if (statusLower.contains('selesai')) {
        badgeColor = Colors.green;
      } else if (statusLower.contains('tolak')) {
        badgeColor = Colors.red;
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.textPrimary,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailColumn({required IconData icon, required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20.sp, color: ColorName.primary),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.textPrimary,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label : ",
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorName.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
