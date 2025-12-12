import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';

@RoutePage()
class CheckReportStatusResultScreen extends StatelessWidget {
  final String ticketNumber;
  final String status;
  final String serviceType;
  final String opdDestination;

  const CheckReportStatusResultScreen({
    super.key,
    required this.ticketNumber,
    required this.status,
    required this.serviceType,
    required this.opdDestination,
  });

  // Helper: Memformat teks agar lebih rapi (Capitalize & Remove Underscore)
  // Contoh API: "pelaporan_online" -> Menjadi: "Pelaporan Online"
  String _formatText(String text) {
    if (text.isEmpty) return "-";
    try {
      return text
          .split('_')
          .map((word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : '')
          .join(' ');
    } catch (_) {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // AppBar opsional, dimatikan agar fokus ke card di tengah
      // appBar: AppPrimaryBar(title: t.app.check_report_status_title),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Container(
            width: double.infinity,
            // Tinggi container disesuaikan
            height: MediaQuery.of(context).size.height - 120.h,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🔹 Kartu Status Laporan (Data Real dari API)
                    ReportStatusCard(
                      ticketNumber: ticketNumber,
                      status: _formatText(status), // Format text agar rapi
                      serviceType: _formatText(serviceType),
                      opdDestination: opdDestination,
                      onBack: () => context.router.pop(),

                      // 🗣 Translation Labels
                      title: t.app.report_found_title,
                      yourReportLabel: t.app.your_report_label,
                      ticketLabel: t.app.ticket_label,
                      statusLabel: t.app.status_label,
                      serviceTypeLabel: t.app.service_type_label,
                      opdLabel: t.app.destination_opd_label,
                    ),

                    SizedBox(height: 32.h),

                    // 🔹 Tombol Kembali
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton.icon(
                        onPressed: () => context.router.pop(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: ColorName.onPrimary,
                          size: 18.sp,
                        ),
                        label: Text(
                          t.app.back_button,
                          style: TextStyle(
                            color: ColorName.onPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorName.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          elevation: 2,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}