import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? imageAsset;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 Deteksi apakah imageAsset adalah URL network
    final isNetworkImage =
        imageAsset != null && imageAsset!.startsWith('http');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        children: [
          // Profile Picture with Edit Icon
          Stack(
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                  image: imageAsset != null
                      ? DecorationImage(
                          image: isNetworkImage
                              ? NetworkImage(imageAsset!)
                              : AssetImage(imageAsset!) as ImageProvider,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: imageAsset == null
                    ? Icon(
                        Icons.person,
                        size: 50.sp,
                        color: Colors.grey.shade400,
                      )
                    : null,
              ),

              // // ✏️ Edit Icon
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: Container(
              //     width: 32.w,
              //     height: 32.w,
              //     decoration: BoxDecoration(
              //       color: ColorName.primary,
              //       shape: BoxShape.circle,
              //       border: Border.all(
              //         color: ColorName.white,
              //         width: 3.w,
              //       ),
              //     ),
              //     child: Icon(
              //       Icons.edit,
              //       size: 16.sp,
              //       color: ColorName.white,
              //     ),
              //   ),
              // ),
            ],
          ),

          SizedBox(height: 16.h),

          // 👤 Name
          Text(
            name,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
          ),

          SizedBox(height: 4.h),

          // ✉️ Email
          Text(
            email,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
