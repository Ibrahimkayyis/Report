import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? imageAsset;
  final String? dinas; // ✅ Field Baru
  final String? unitKerja; // ✅ Field Baru

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.imageAsset,
    this.dinas,
    this.unitKerja,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage =
        imageAsset != null && (imageAsset!.startsWith('http') || imageAsset!.startsWith('https'));

    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        children: [
          // Profile Picture
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

          SizedBox(height: 16.h),

          // 👤 Name
          Text(
            name,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
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

          // 🏢 Dinas / Unit Kerja (Jika Ada)
          if (dinas != null || unitKerja != null) ...[
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: ColorName.primary.withValues(alpha:0.08),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  if (dinas != null)
                    Text(
                      dinas!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  if (unitKerja != null && unitKerja != dinas) // Hindari duplikasi jika nama sama
                    Text(
                      unitKerja!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: ColorName.primary.withValues(alpha:0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}