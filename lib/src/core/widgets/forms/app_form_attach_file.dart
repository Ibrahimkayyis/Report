import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormAttachFile extends StatelessWidget {
  final String? title;

  const AppFormAttachFile({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final effectiveTitle = title ?? t.app.attach_file_title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          effectiveTitle,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          t.app.attach_file_subtitle,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 12.h),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Implement file picker
          },
          icon: Icon(Icons.attach_file, size: 18.sp),
          label: Text(t.app.attach_file_button),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.primary,
            foregroundColor: ColorName.background,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
