import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class ReportSuccessBottomActions extends StatelessWidget {
  final VoidCallback onCheckStatus;
  final VoidCallback onCreateNewReport;
  final VoidCallback onBackToHome;

  const ReportSuccessBottomActions({
    super.key,
    required this.onCheckStatus,
    required this.onCreateNewReport,
    required this.onBackToHome,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Check Status
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCheckStatus,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  t.app.check_service_status,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Create New Report & Back to Home
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCreateNewReport,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorName.primary,
                      side: BorderSide(color: ColorName.primary, width: 1.5.w),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      t.app.create_new_report,
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onBackToHome,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey.shade700,
                      side: BorderSide(color: Colors.grey.shade300, width: 1.5.w),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      t.app.back_to_home,
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
