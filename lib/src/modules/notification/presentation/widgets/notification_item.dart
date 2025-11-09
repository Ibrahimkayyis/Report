import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String type;
  final String time;
  final bool isRead;
  final IconData icon;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.type,
    required this.time,
    this.isRead = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.notifications;

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color:
            isRead ? ColorName.background : ColorName.primary.withValues(alpha:0.06),
        borderRadius: BorderRadius.circular(12.r),
      ),
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔵 Icon
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: ColorName.primary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: ColorName.onPrimary,
              size: 22.sp,
            ),
          ),

          SizedBox(width: 12.w),

          /// 📝 Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Row: Title + Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorName.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      t.time_ago.replaceAll('{time}', time),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorName.textPrimary.withValues(alpha:0.6),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                /// Deskripsi
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorName.textPrimary.withValues(alpha:0.8),
                    height: 1.4,
                  ),
                ),

                SizedBox(height: 8.h),

                /// 🏷️ Type Tag di bawah deskripsi
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: ColorName.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: ColorName.onPrimary,
                      fontWeight: FontWeight.w500,
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
