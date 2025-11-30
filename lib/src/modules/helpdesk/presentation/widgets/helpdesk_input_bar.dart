import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class HelpdeskInputBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onAttachPressed;
  final VoidCallback onSendPressed;
  final bool isFileSelected;

  const HelpdeskInputBar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onAttachPressed,
    required this.onSendPressed,
    this.isFileSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 16.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(color: ColorName.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onAttachPressed,
                    icon: Icon(
                      isFileSelected ? Icons.attach_file : Icons.add_circle_outline,
                      color: isFileSelected ? Colors.green : ColorName.primary,
                    ),
                    iconSize: 22.sp,
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(width: 10.w),
          
          // Send Button
          Container(
            width: 44.w, height: 44.w,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorName.primary),
            child: IconButton(
              onPressed: onSendPressed,
              icon: const Icon(Icons.send_rounded, color: ColorName.onPrimary),
              iconSize: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}