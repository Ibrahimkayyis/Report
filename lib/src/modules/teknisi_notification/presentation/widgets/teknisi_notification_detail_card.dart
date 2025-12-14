import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk Clipboard
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class TeknisiNotificationDetailCard extends StatelessWidget {
  final String type; 
  final String? ticketNumber;
  final String? status;
  final String? serviceType;
  final String? opdDestination;
  final String? illustrationLabel; 

  const TeknisiNotificationDetailCard({
    super.key,
    required this.type,
    this.ticketNumber,
    this.status,
    this.serviceType,
    this.opdDestination,
    this.illustrationLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // 1. ILUSTRASI
          _buildIllustration(),

          SizedBox(height: 16.h),

          // 2. JUDUL
          Text(
            illustrationLabel ?? "Detail",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
          ),

          SizedBox(height: 24.h),

          // TIKET NUMBER BOX
          if (ticketNumber != null) ...[
            Text("No. Tiket:", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
            SizedBox(height: 6.h),
            
            // ROW COPY TIKET (Widget Baru di Teknisi)
            _buildTicketCopyRow(context, ticketNumber!),
            
            SizedBox(height: 16.h),
          ],

          // STATUS
          if (status != null) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: _getStatusColor(status!),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                status!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],

          Divider(color: Colors.grey.shade200),
          SizedBox(height: 24.h),

          // INFO DETAIL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoItem(Icons.assignment, "Jenis Layanan", serviceType ?? "-"),
              _buildInfoItem(Icons.location_city, "OPD Asal", opdDestination ?? "-"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    return Container(
      height: 80.w,
      width: 80.w,
      decoration: BoxDecoration(
        color: ColorName.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.assignment_ind, size: 40.sp, color: ColorName.primary),
    );
  }

  Widget _buildTicketCopyRow(BuildContext context, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F4E79),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No. Tiket disalin!")),
              );
            },
            child: Icon(Icons.copy, color: Colors.white, size: 18.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.grey, size: 20.sp),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
          SizedBox(height: 2.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status.contains('Tugas')) return Colors.blueAccent.withOpacity(0.2);
    if (status.contains('Selesai')) return Colors.greenAccent.withOpacity(0.4);
    return Colors.grey.shade300;
  }
}