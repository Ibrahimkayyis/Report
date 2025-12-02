import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final AssetGenImage? image;
  final VoidCallback? onRefresh;

  const AppEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.image,
    this.onRefresh,
  });

  // 1. Factory: List Kosong (Default)
  factory AppEmptyState.list({
    required BuildContext context, 
    String? message,
    VoidCallback? onRefresh,
  }) {
    final t = context.t.widgets.empty;
    return AppEmptyState(
      title: t.list_title,
      message: message ?? t.list_message,
      // ✅ Aset Empty List
      image: Assets.images.emptyList, 
      onRefresh: onRefresh,
    );
  }

  // 2. Factory: Search Not Found
  factory AppEmptyState.search({
    required BuildContext context, 
    VoidCallback? onRefresh,
  }) {
    final t = context.t.widgets.empty;
    return AppEmptyState(
      title: t.search_title,
      message: t.search_message,
      // ✅ Aset Search Not Found
      image: Assets.images.searchNotFound, 
      onRefresh: onRefresh,
    );
  }

  // 3. Factory: Notifikasi Kosong
  factory AppEmptyState.notification({
    required BuildContext context, 
    VoidCallback? onRefresh,
  }) {
    final t = context.t.widgets.empty;
    return AppEmptyState(
      title: t.notification_title,
      message: t.notification_message,
      // ✅ Aset Empty Notification
      image: Assets.images.emptyNotification, 
      onRefresh: onRefresh,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.widgets.empty; 

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Gambar
            if (image != null)
              image!.image(
                width: 220.w, // Sedikit lebih besar untuk empty state
                height: 220.w,
                fit: BoxFit.contain,
              )
            else
              Icon(
                Icons.inbox_rounded,
                size: 80.sp,
                color: Colors.grey.shade300,
              ),

            SizedBox(height: 24.h),

            // 🔹 Judul
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorName.textPrimary,
              ),
            ),

            SizedBox(height: 8.h),

            // 🔹 Deskripsi
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade500,
                height: 1.5,
              ),
            ),

            // 🔹 Button Refresh Data
            if (onRefresh != null) ...[
              SizedBox(height: 32.h),
              SizedBox(
                width: 160.w,
                child: OutlinedButton.icon(
                  onPressed: onRefresh,
                  icon: Icon(Icons.refresh, size: 18, color: ColorName.primary),
                  label: Text(
                    t.refresh,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorName.primary,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: ColorName.primary),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}