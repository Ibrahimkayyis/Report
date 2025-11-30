import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackbarType { success, error, warning, info }

class AppSnackbar {
  AppSnackbar._();

  static void show(
    BuildContext context, {
    required String title,
    required String message,
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final config = _getConfig(type);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _SnackbarContent(
          title: title,
          message: message,
          icon: config.icon,
        ),
        backgroundColor: config.color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.all(16.w),
        elevation: 6,
        duration: duration,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }

  static void success(BuildContext context, {required String title, required String message}) {
    show(context, title: title, message: message, type: SnackbarType.success);
  }

  static void error(BuildContext context, {required String title, required String message}) {
    show(context, title: title, message: message, type: SnackbarType.error, duration: const Duration(seconds: 4));
  }

  static _SnackbarConfig _getConfig(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return _SnackbarConfig(color: const Color(0xFF4CAF50), icon: Icons.check_circle_rounded);
      case SnackbarType.error:
        return _SnackbarConfig(color: const Color(0xFFE53935), icon: Icons.error_rounded);
      case SnackbarType.warning:
        return _SnackbarConfig(color: const Color(0xFFFFA726), icon: Icons.warning_rounded);
      case SnackbarType.info:
        return _SnackbarConfig(color: const Color(0xFF2196F3), icon: Icons.info_rounded);
    }
  }
}

class _SnackbarConfig {
  final Color color;
  final IconData icon;
  const _SnackbarConfig({required this.color, required this.icon});
}

class _SnackbarContent extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const _SnackbarContent({
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withValues(alpha: 0.9),
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