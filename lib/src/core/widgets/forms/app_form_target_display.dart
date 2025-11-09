import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormTargetDisplay extends StatelessWidget {
  final String name;
  final String? imageUrl; // ✅ ubah dari IconData jadi String?
  final Color color;

  const AppFormTargetDisplay({
    super.key,
    required this.name,
    this.imageUrl,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.send_report_to,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: ColorName.primary,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              // ✅ tampilkan gambar dari URL jika tersedia
              Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(6.r),
                  image: (imageUrl != null && imageUrl!.isNotEmpty)
                      ? DecorationImage(
                          image: NetworkImage(imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: (imageUrl == null || imageUrl!.isEmpty)
                    ? Icon(
                        Icons.apartment_rounded,
                        color: ColorName.white,
                        size: 16.sp,
                      )
                    : null,
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorName.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
