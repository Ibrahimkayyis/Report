import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ShimmerBox(height: 18, width: 120),
        SizedBox(height: 6.h),
        _ShimmerBox(height: 42, width: double.infinity),
        SizedBox(height: 16.h),
        _ShimmerBox(height: 18, width: 80),
        SizedBox(height: 6.h),
        _ShimmerBox(height: 42, width: double.infinity),
        SizedBox(height: 16.h),
        _ShimmerBox(height: 18, width: 100),
        SizedBox(height: 6.h),
        _ShimmerBox(height: 42, width: double.infinity),
      ],
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double height;
  final double width;

  const _ShimmerBox({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height.h,
        width: width == double.infinity ? double.infinity : width.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}