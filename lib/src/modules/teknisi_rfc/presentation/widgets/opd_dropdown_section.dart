import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class OpdDropdownSection extends StatelessWidget {
  final String label;
  final String hint;
  final String? selectedOpdId;
  final String? errorText;
  
  final List<dynamic> items; 
  final bool isLoading;
  final bool isError;
  
  final ValueChanged<dynamic> onChanged;
  final VoidCallback? onRetry;

  const OpdDropdownSection({
    super.key,
    required this.label,
    required this.hint,
    required this.selectedOpdId,
    required this.onChanged,
    this.items = const [],
    this.isLoading = false,
    this.isError = false,
    this.onRetry,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildShimmer();
    } 
    else if (isError) {
      return _buildErrorState();
    }

    return AppDropdownFieldWithIcon<dynamic>(
      label: label,
      value: selectedOpdId != null
          ? items.firstWhereOrNull((item) => item.opdId == selectedOpdId)
          : null,
      items: items,
      displayBuilder: (item) => item.opdName, 
      iconUrlBuilder: (item) => item.filePath,
      onChanged: onChanged,
      errorText: errorText,
    );
  }

  Widget _buildShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: _labelStyle()),
        SizedBox(height: 6.h),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: _labelStyle()),
        SizedBox(height: 6.h),
        Container(
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.red.shade300),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline, size: 20.sp, color: Colors.red.shade400),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Gagal memuat data',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                ),
              ),
              if (onRetry != null)
                TextButton(
                  onPressed: onRetry,
                  child: Text(
                    'Coba Lagi',
                    style: TextStyle(
                      fontSize: 12.sp, 
                      fontWeight: FontWeight.w600, 
                      color: ColorName.primary
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: 6.h),
          Text(errorText!, style: TextStyle(fontSize: 12.sp, color: Colors.red)),
        ]
      ],
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ColorName.textPrimary,
    );
  }
}