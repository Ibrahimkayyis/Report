import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/reporting/domain/models/opd_model.dart';
import 'package:shimmer/shimmer.dart';

class HelpdeskChatHeader extends StatelessWidget {
  final String introText;
  final String labelText;
  final String hintText;
  
  // Data & State
  final List<OpdModel> opdList;
  final OpdModel? selectedOpd;
  final bool isLoading;
  final String? errorMessage;
  
  // Callbacks
  final ValueChanged<OpdModel?> onOpdChanged;

  const HelpdeskChatHeader({
    super.key,
    required this.introText,
    required this.labelText,
    required this.hintText,
    required this.opdList,
    required this.selectedOpd,
    required this.onOpdChanged,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            introText,
            style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
          ),
          SizedBox(height: 12.h),
          
          // Conditional UI berdasarkan state
          if (isLoading)
            _buildShimmer()
          else if (errorMessage != null)
            Text(errorMessage!, style: TextStyle(color: Colors.red, fontSize: 13.sp))
          else
            _buildDropdown(),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Text(
            labelText,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: ColorName.textPrimary),
          ),
        ),
        SizedBox(width: 12.w),
        Flexible(
          flex: 7,
          child: CustomDropdown<OpdModel>.search(
            hintText: hintText,
            items: opdList,
            initialItem: selectedOpd,
            onChanged: onOpdChanged,
            listItemBuilder: (context, opd, isSelected, onItemSelect) => _buildOpdItem(opd),
            headerBuilder: (context, opd, isSelected) => _buildOpdItem(opd),
            decoration: CustomDropdownDecoration(
              closedFillColor: ColorName.white,
              closedBorder: Border.all(color: Colors.grey.shade400),
              closedBorderRadius: BorderRadius.circular(10.r),
              expandedBorderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOpdItem(OpdModel opd) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14.r,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: (opd.filePath ?? '').isNotEmpty ? NetworkImage(opd.filePath!) : null,
          child: (opd.filePath ?? '').isEmpty ? Icon(Icons.account_balance, size: 16.sp, color: Colors.grey.shade600) : null,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            opd.opdName,
            style: TextStyle(fontSize: 14.sp, color: ColorName.textPrimary),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 42.h,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}