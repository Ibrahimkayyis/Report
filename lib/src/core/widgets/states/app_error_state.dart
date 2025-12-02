import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppErrorState extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;
  final AssetGenImage? image;

  const AppErrorState({
    super.key,
    required this.title,
    required this.message,
    this.onRetry,
    this.image,
  });

  // ===========================================================================
  // FACTORY METHODS
  // ===========================================================================

  // 1. Network Error
  factory AppErrorState.network({
    required BuildContext context,
    VoidCallback? onRetry,
  }) {
    final t = context.t.widgets.error;
    return AppErrorState(
      title: t.network_title,
      // Best Practice: Gunakan pesan ramah dari translation, jangan raw error
      message: t.network_message, 
      image: Assets.images.generalError, // Gunakan aset yang sesuai
      onRetry: onRetry,
    );
  }

  // 2. Server Error
  factory AppErrorState.server({
    required BuildContext context,
    String? message, // Pesan teknis dari API (Opsional)
    VoidCallback? onRetry,
  }) {
    final t = context.t.widgets.error;
    return AppErrorState(
      title: t.server_title,
      // Jika ada pesan API, gunakan. TAPI widget build di bawah akan memotongnya jika kepanjangan.
      // Jika null, gunakan pesan default yang ramah.
      message: message ?? t.server_message,
      image: Assets.images.serverError,
      onRetry: onRetry,
    );
  }

  // 3. General Error
  factory AppErrorState.general({
    required BuildContext context,
    String? message,
    VoidCallback? onRetry,
  }) {
    final t = context.t.widgets.error;
    return AppErrorState(
      title: t.general_title,
      message: message ?? t.general_message,
      image: Assets.images.generalError,
      onRetry: onRetry,
    );
  }

  // ===========================================================================
  // UI BUILDER
  // ===========================================================================
  @override
  Widget build(BuildContext context) {
    final t = context.t.widgets.error;

    return Center(
      child: SingleChildScrollView( // ✅ 1. Bungkus ScrollView agar aman di layar kecil landscape
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Gambar Aset
            if (image != null)
              image!.image(
                width: 200.w,
                height: 200.w,
                fit: BoxFit.contain,
              )
            else
              Icon(
                Icons.error_outline_rounded,
                size: 80.sp,
                color: Colors.red.shade300,
              ),

            SizedBox(height: 24.h),

            // 🔹 Tipe Error (Judul)
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

            // 🔹 Penjelasan Error (Anti Overflow)
            Text(
              message,
              textAlign: TextAlign.center,
              // ✅ 2. Batasi jumlah baris (Max 3 baris cukup untuk penjelasan)
              maxLines: 4, 
              // ✅ 3. Jika kepanjangan, beri titik-titik (...)
              overflow: TextOverflow.ellipsis, 
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),

            // 🔹 Button Refresh
            if (onRetry != null) ...[
              SizedBox(height: 32.h),
              SizedBox(
                width: 160.w,
                child: ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh, size: 18, color: Colors.white),
                  label: Text(
                    t.retry,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorName.primary,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 0,
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