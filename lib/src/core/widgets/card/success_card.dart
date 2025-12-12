import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import '../../../modules/reporting/presentation/widgets/success/copyable_field.dart';

class SuccessCard extends StatelessWidget {
  final String ticketNumber;
  final String status;
  final String opdName;

  /// 🧠 Texts injected from outside (screen)
  final String title;
  final String description;
  final String checkWithLabel;
  final String ticketLabel;
  final String statusLabel;
  final String serviceTypeLabel;
  final String serviceTypeValue;
  final String destinationLabel;
  final String downloadLabel;

  /// ✅ ADDED: Detail Fields (Optional) untuk data dinamis di card
  final Map<String, String>? detailFields;

  final VoidCallback? onDownload;

  const SuccessCard({
    super.key,
    required this.ticketNumber,
    required this.status,
    required this.opdName,
    required this.title,
    required this.description,
    required this.checkWithLabel,
    required this.ticketLabel,
    required this.statusLabel,
    required this.serviceTypeLabel,
    required this.serviceTypeValue,
    required this.destinationLabel,
    required this.downloadLabel,
    this.detailFields, // ✅
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.08),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          // ✅ Success Icon
          Container(
            width: 80.w,
            height: 80.w,
            decoration: const BoxDecoration(
              color: ColorName.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, size: 48.sp, color: ColorName.white),
          ),

          SizedBox(height: 24.h),

          // ✅ Dynamic Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
          ),

          SizedBox(height: 12.h),

          // ✅ Dynamic Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),

          SizedBox(height: 24.h),

          // ✅ Check with Ticket & PIN
          Text(
            checkWithLabel,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorName.textPrimary,
            ),
          ),

          SizedBox(height: 16.h),

          CopyableField(label: ticketLabel, value: ticketNumber),
          SizedBox(height: 12.h),
          CopyableField(label: statusLabel, value: status),

          SizedBox(height: 24.h),

          // ✅ Service Details
          _buildServiceDetails(),

          SizedBox(height: 16.h),

          // ✅ Download Ticket
          OutlinedButton.icon(
            onPressed: onDownload,
            icon: Icon(Icons.download, size: 18.sp),
            label: Text(downloadLabel),
            style: OutlinedButton.styleFrom(
              foregroundColor: ColorName.primary,
              side: BorderSide(color: ColorName.primary, width: 1.5.w),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDetails() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Service Type
          _buildDetailRow(
            icon: Icons.description,
            label: serviceTypeLabel,
            value: serviceTypeValue,
          ),
          
          SizedBox(height: 12.h),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 12.h),

          // OPD
          _buildDetailRow(
            icon: Icons.send,
            label: destinationLabel,
            value: opdName,
          ),

          // ✅ RENDER DETAIL FIELDS TAMBAHAN DISINI
          if (detailFields != null && detailFields!.isNotEmpty) ...[
             SizedBox(height: 12.h),
             Divider(color: Colors.grey.shade300),
             SizedBox(height: 12.h),
             
             ...detailFields!.entries.map((e) => Padding(
               padding: EdgeInsets.only(bottom: 12.h),
               child: _buildDetailRow(
                 icon: Icons.info_outline, // Icon generik untuk detail
                 label: e.key,
                 value: e.value,
               ),
             )),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required String label, required String value}) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: ColorName.primary),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}