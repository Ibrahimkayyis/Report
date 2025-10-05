import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'copyable_field.dart';

class SuccessCard extends StatelessWidget {
  final String ticketNumber;
  final String pin;
  final String opdName;

  const SuccessCard({
    super.key,
    required this.ticketNumber,
    required this.pin,
    required this.opdName,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
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
            decoration: BoxDecoration(
              color: ColorName.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              size: 48.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24.h),

          // ✅ Title
          Text(
            t.app.report_success_title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),

          // ✅ Description
          Text(
            t.app.report_success_description,
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
            t.app.check_report_with,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorName.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),

          CopyableField(label: t.app.ticket_number, value: ticketNumber),
          SizedBox(height: 12.h),
          CopyableField(label: t.app.pin, value: pin),

          SizedBox(height: 24.h),

          // ✅ QR Placeholder
          Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade300, width: 2.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code, size: 80.sp, color: ColorName.primary),
                SizedBox(height: 8.h),
                Text(
                  'QR Code',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // ✅ Service Details
          _buildServiceDetails(t),
          SizedBox(height: 16.h),

          // ✅ Download Ticket
          OutlinedButton.icon(
            onPressed: () {
              // TODO: Implement download
            },
            icon: Icon(Icons.download, size: 18.sp),
            label: Text(t.app.download_ticket),
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

  Widget _buildServiceDetails(Translations t) {
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
          Row(
            children: [
              Icon(Icons.description, size: 20.sp, color: ColorName.primary),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.app.service_type,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
                  ),
                  Text(
                    t.app.service_type_reporting,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorName.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 12.h),

          // OPD
          Row(
            children: [
              Icon(Icons.send, size: 20.sp, color: ColorName.primary),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.app.destination_opd,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      opdName,
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
          ),
        ],
      ),
    );
  }
}
