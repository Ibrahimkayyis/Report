import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class ProfileInfoCard extends StatelessWidget {
  final String name;
  final String role;
  final String? imageAsset;

  const ProfileInfoCard({
    super.key,
    required this.name,
    required this.role,
    this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          // Stronger primary shadow for more visible depth
          BoxShadow(
            color: ColorName.black.withOpacity(0.18),
            blurRadius: 26.r,
            spreadRadius: 1.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Picture
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
              image: imageAsset != null
                  ? DecorationImage(
                      image: AssetImage(imageAsset!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageAsset == null
                ? Icon(
                    Icons.person,
                    size: 35.sp,
                    color: Colors.grey.shade400,
                  )
                : null,
          ),
          
          SizedBox(width: 16.w),
          
          // Name and Role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorName.textPrimary,
                  ),
                ),
                
                SizedBox(height: 8.h),
                
                // Role Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: ColorName.primary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    role,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorName.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}