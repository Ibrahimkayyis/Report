import 'dart:io';
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
    // ✅ Perbaikan: Cek apakah ini network image, file path, atau asset
    final isNetworkImage = imageAsset != null && 
        (imageAsset!.startsWith('http://') || imageAsset!.startsWith('https://'));
    
    final isFilePath = imageAsset != null && 
        (imageAsset!.startsWith('/') || imageAsset!.contains('cache'));

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.18),
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
            ),
            child: ClipOval(
              child: imageAsset != null
                  ? (isNetworkImage
                      ? Image.network(
                          imageAsset!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              size: 35.sp,
                              color: Colors.grey.shade400,
                            );
                          },
                        )
                      : isFilePath
                          ? Image.file(
                              File(imageAsset!),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size: 35.sp,
                                  color: Colors.grey.shade400,
                                );
                              },
                            )
                          : Image.asset(
                              imageAsset!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size: 35.sp,
                                  color: Colors.grey.shade400,
                                );
                              },
                            ))
                  : Icon(
                      Icons.person,
                      size: 35.sp,
                      color: Colors.grey.shade400,
                    ),
            ),
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