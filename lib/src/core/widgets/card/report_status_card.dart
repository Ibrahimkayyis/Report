import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class ReportStatusCard extends StatelessWidget {
  final String ticketNumber;
  final String status;
  final String serviceType;
  final String opdDestination;
  final VoidCallback? onBack;

  /// Translation-based labels
  final String title;
  final String yourReportLabel;
  final String ticketLabel;
  final String statusLabel;
  final String serviceTypeLabel;
  final String opdLabel;

  const ReportStatusCard({
    super.key,
    required this.ticketNumber,
    required this.status,
    required this.serviceType,
    required this.opdDestination,
    this.onBack,
    required this.title,
    required this.yourReportLabel,
    required this.ticketLabel,
    required this.statusLabel,
    required this.serviceTypeLabel,
    required this.opdLabel,
  });

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return const Color(0xFFFFC107); // Kuning
      case 'selesai':
      case 'done':
        return const Color(0xFF4CAF50); // Hijau
      case 'ditolak':
      case 'rejected':
        return const Color(0xFFE74C3C); // Merah
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha:0.08),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ✅ Check Icon
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              color: ColorName.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: ColorName.white, size: 32.sp),
          ),

          SizedBox(height: 16.h),

          // ✅ Title
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
          ),

          SizedBox(height: 20.h),

          // ✅ Label "Pengaduan Anda:"
          Text(
            yourReportLabel,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
          ),

          SizedBox(height: 16.h),

          // ✅ Ticket Number Row
          // ✅ Ticket Number & Status Section (aligned perfectly)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w, // ✅ Lebar label tetap biar sejajar
                    child: Text(
                      ticketLabel,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorName.textPrimary,
                      ),
                    ),
                  ),
                  Container(
                    width: 150.w, // ✅ Lebar badge tetap
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                      color: ColorName.primary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      ticketNumber,
                      style: TextStyle(
                        color: ColorName.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w, // ✅ Lebar label sama dengan di atas
                    child: Text(
                      statusLabel,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorName.textPrimary,
                      ),
                    ),
                  ),
                  Container(
                    width: 150.w, // ✅ Lebar badge sama juga
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                      color: _statusColor(status),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: ColorName.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // ✅ Service Type and OPD
          Row(
            children: [
              // 🔹 Jenis Layanan
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon in circle
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: ColorName.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorName.black.withValues(alpha:0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.description,
                        size: 20.sp,
                        color: ColorName.primary,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serviceTypeLabel,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            serviceType,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorName.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 16.w),

              // 🔹 OPD Tujuan
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon in circle
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: ColorName.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorName.black.withValues(alpha:0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.send,
                        size: 20.sp,
                        color: ColorName.primary,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            opdLabel,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            opdDestination,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorName.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
