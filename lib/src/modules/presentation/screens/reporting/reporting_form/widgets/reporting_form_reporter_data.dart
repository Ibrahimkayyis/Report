import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class ReportingFormReporterData extends StatelessWidget {
  final String name;
  final String nip;
  final String division;

  const ReportingFormReporterData({
    super.key,
    required this.name,
    required this.nip,
    required this.division,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      children: [
        _buildReadOnlyField(t.app.reporter_name, name),
        SizedBox(height: 12.h),
        _buildReadOnlyField(t.app.reporter_nip, nip),
        SizedBox(height: 12.h),
        _buildReadOnlyField(t.app.reporter_division, division),
      ],
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}
