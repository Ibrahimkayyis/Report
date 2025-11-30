// lib/src/core/widgets/fields/app_dropdown_field_with_icon.dart

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

/// Dropdown field with icon support for objects (e.g., OPD with icon)
/// Use this when you need to display items with icons
/// For simple string dropdowns, use AppDropdownField instead
class AppDropdownFieldWithIcon<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String? errorText;
  
  /// Function to get display text from item
  final String Function(T) displayBuilder;
  
  /// Function to get icon URL from item (optional)
  final String? Function(T)? iconUrlBuilder;

  const AppDropdownFieldWithIcon({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.displayBuilder,
    this.iconUrlBuilder,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;
    final hasIcon = iconUrlBuilder != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ ADD LABEL TEXT (like original AppDropdownField)
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        
        CustomDropdown<T>(
          hintText: label,
          items: items,
          initialItem: value,
          onChanged: onChanged,
          decoration: CustomDropdownDecoration(
            closedFillColor: ColorName.white,
            closedBorder: Border.all(
              color: hasError ? Colors.red : Colors.grey.shade400,
              width: hasError ? 2 : 1,
            ),
            closedBorderRadius: BorderRadius.circular(8.r),
            expandedBorderRadius: BorderRadius.circular(8.r),
            listItemStyle: TextStyle(fontSize: 14.sp, color: ColorName.black),
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
          ),
          
          // ✅ Custom header builder (closed state - selected value)
          headerBuilder: hasIcon
              ? (context, selectedItem, enabled) {
                  if (selectedItem == null) {
                    return Text(
                      label,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade500,
                      ),
                    );
                  }

                  final iconUrl = iconUrlBuilder!(selectedItem);
                  final displayText = displayBuilder(selectedItem);

                  return Row(
                    children: [
                      // ✅ Icon/Image (24x24)
                      if (iconUrl != null && iconUrl.isNotEmpty)
                        Container(
                          width: 24.w,
                          height: 24.w,
                          margin: EdgeInsets.only(right: 8.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: Image.network(
                              iconUrl,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: Icon(
                                    Icons.business,
                                    size: 16.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.business,
                                    size: 16.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      // ✅ Text
                      Expanded(
                        child: Text(
                          displayText,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorName.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                }
              : null,
          
          // ✅ Custom list item builder (expanded state - dropdown items)
          listItemBuilder: hasIcon
              ? (context, item, isSelected, onItemSelect) {
                  final iconUrl = iconUrlBuilder!(item);
                  final displayText = displayBuilder(item);

                  return InkWell(
                    onTap: onItemSelect,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      color: isSelected
                          ? ColorName.primary.withOpacity(0.1)
                          : Colors.transparent,
                      child: Row(
                        children: [
                          // ✅ Icon/Image (32x32)
                          if (iconUrl != null && iconUrl.isNotEmpty)
                            Container(
                              width: 32.w,
                              height: 32.w,
                              margin: EdgeInsets.only(right: 12.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.r),
                                child: Image.network(
                                  iconUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: Icon(
                                        Icons.business,
                                        size: 20.sp,
                                        color: Colors.grey.shade400,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(
                                        Icons.business,
                                        size: 20.sp,
                                        color: Colors.grey.shade400,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          // ✅ Text
                          Expanded(
                            child: Text(
                              displayText,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: isSelected
                                    ? ColorName.primary
                                    : ColorName.textPrimary,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // ✅ Checkmark for selected
                          if (isSelected)
                            Icon(
                              Icons.check,
                              size: 20.sp,
                              color: ColorName.primary,
                            ),
                        ],
                      ),
                    ),
                  );
                }
              : null,
        ),
        
        // ✅ ERROR TEXT
        if (hasError) ...[
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(
                Icons.error_outline,
                size: 14.sp,
                color: Colors.red,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  errorText!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}