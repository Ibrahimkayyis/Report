import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: ColorName.background,
      child: Row(
        children: [
          // Logo
          Image.asset(
            Assets.images.reportLogo.path,
            width: 32.w,
            height: 32.w,
            fit: BoxFit.contain,
          ),
          
          SizedBox(width: 12.w),
          
          // Search Bar
          Expanded(
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200, // Darker background
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: t.app.search_placeholder,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  
                  // Search Icon in Circle
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2.r,
                            offset: Offset(0, 1.h),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.search,
                        color: ColorName.primary,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(width: 12.w),
          
          // Notification Icon with Enhanced Shadow
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: ColorName.background,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorName.textPrimary.withOpacity(0.15), // Increased opacity
                  blurRadius: 8.r, // Increased blur radius
                  offset: Offset(0, 4.h), // Increased offset
                  spreadRadius: 1.r, // Added spread radius
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_outlined,
                    color: ColorName.textPrimary,
                    size: 20.sp,
                  ),
                ),
                
                // Notification Dot
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: Colors.red, // Changed to pure red for better visibility
                      shape: BoxShape.circle,
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