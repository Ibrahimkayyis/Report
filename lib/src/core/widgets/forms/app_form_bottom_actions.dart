import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormBottomActions extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSaveDraft;
  final VoidCallback onSubmit;

  const AppFormBottomActions({
    super.key,
    required this.onCancel,
    required this.onSaveDraft,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Cancel
            Expanded(
              flex: 1,
              child: OutlinedButton(
                onPressed: onCancel,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey.shade700,
                  side: BorderSide(color: Colors.grey.shade300, width: 1.w),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                child: Text(
                  t.app.cancel_button,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 6.w),

            // Save Draft
            // Expanded(
            //   flex: 1,
            //   child: OutlinedButton(
            //     onPressed: onSaveDraft,
            //     style: OutlinedButton.styleFrom(
            //       foregroundColor: ColorName.primary,
            //       side: BorderSide(color: ColorName.primary, width: 1.w),
            //       padding: EdgeInsets.symmetric(vertical: 10.h),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(6.r),
            //       ),
            //     ),
            //     child: Text(
            //       t.app.save_draft_button,
            //       style: TextStyle(
            //         fontSize: 13.sp,
            //         fontWeight: FontWeight.w500,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            // SizedBox(width: 6.w),

            // Submit
            Expanded(
              flex: 1.5.toInt(),
              child: ElevatedButton(
                onPressed: onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.primary,
                  foregroundColor: ColorName.onPrimary,
                  padding: EdgeInsets.symmetric(vertical: 11.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  t.app.submit_report_button,
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
