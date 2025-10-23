import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'service_item.dart';

class ServiceRequestCard extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback? onTap;

  const ServiceRequestCard({
    super.key,
    required this.service,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onTap,
        child: Container(
          height: 130.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: ColorName.primary,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: ColorName.black.withOpacity(0.08),
                blurRadius: 8.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Row(
            children: [
              // ✅ Icon pakai FlutterGen (tanpa widget tambahan)
              Container(
                width: 80.w,
                height: 80.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorName.primary,
                ),
                child: Center(
                  child: Image.asset(
                    service.asset.path,
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(width: 16.w),

              // Title
              Expanded(
                child: Text(
                  service.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorName.onPrimary,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.sp,
                color: ColorName.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
