import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class EditPhotoButton extends StatelessWidget {
  final VoidCallback onTap;

  const EditPhotoButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: ColorName.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorName.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 20.sp,
        ),
      ),
    );
  }
}