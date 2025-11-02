import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

/// Custom reusable TextFormField.
///
/// Digunakan di berbagai form (login, register, profile, dsb).
/// Sudah mendukung validator, errorText, inputFormatters, dan password mode.
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int? maxLength;
  final bool autofocus;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool readOnly; // ✅ Tambahkan properti ini

  const AppTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.maxLength,
    this.autofocus = false,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.readOnly = false, // ✅ Default false
  });

  @override
  Widget build(BuildContext context) {
    final formatters = <TextInputFormatter>[];
    if (keyboardType == TextInputType.emailAddress) {
      formatters.add(FilteringTextInputFormatter.deny(RegExp(r"\s")));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorName.textPrimary,
            ),
          ),
          SizedBox(height: 6.h),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          maxLines: obscureText ? 1 : maxLines,
          maxLength: maxLength,
          autofocus: autofocus,
          textInputAction: textInputAction,
          inputFormatters: formatters,
          obscureText: obscureText,
          readOnly: readOnly, // ✅ Forward ke TextFormField
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14.sp,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: readOnly
                ? Colors.grey.shade100 // ✅ Warna lebih soft kalau readonly
                : Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ColorName.primary,
                width: 2.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.red.shade400,
                width: 1.5.w,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          style: TextStyle(
            fontSize: 14.sp,
            color: readOnly
                ? Colors.grey.shade600 // ✅ Abu-abu untuk readonly
                : ColorName.textPrimary,
          ),
        ),
      ],
    );
  }
}
