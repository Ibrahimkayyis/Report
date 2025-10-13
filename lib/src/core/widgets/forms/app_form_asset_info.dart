import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormAssetInfo extends StatelessWidget {
  final String assetId;
  final String assetName;
  final String assetLocation;

  const AppFormAssetInfo({
    super.key,
    required this.assetId,
    required this.assetName,
    required this.assetLocation,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.asset_data_title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),

        _buildReadOnlyField(t.app.asset_id_label, assetId),
        SizedBox(height: 12.h),

        _buildReadOnlyField(t.app.asset_name_label, assetName),
        SizedBox(height: 12.h),

        _buildReadOnlyField(t.app.asset_location_label, assetLocation),
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
