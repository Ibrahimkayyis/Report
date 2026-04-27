import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class RatingListShimmer extends StatelessWidget {
  const RatingListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 24.w,
          top: 16.h,
          bottom: 16.h,
        ),
        itemCount: 4, // Tampilkan 4 item dummy
        itemBuilder: (context, index) {
          return _buildShimmerItem();
        },
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Avatar + Name + Stars
            Row(
              children: [
                Container(
                  width: 48.r,
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 16.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 80.w,
                  height: 16.h,
                  color: Colors.white, // Stars placeholder
                ),
              ],
            ),
            
            SizedBox(height: 16.h),

            // Info Rows
            _buildInfoRowShimmer(),
            SizedBox(height: 8.h),
            _buildInfoRowShimmer(),
            SizedBox(height: 8.h),
            _buildInfoRowShimmer(),
            
            SizedBox(height: 8.h),

            // Chips Row (Jenis & Bentuk)
            Row(
              children: [
                Expanded(child: Container(height: 40.h, color: Colors.white)),
                SizedBox(width: 8.w),
                Expanded(child: Container(height: 40.h, color: Colors.white)),
              ],
            ),

            SizedBox(height: 12.h),

            // Button (Lihat)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 80.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRowShimmer() {
    return Row(
      children: [
        Container(width: 16.w, height: 16.w, color: Colors.white), // Icon
        SizedBox(width: 8.w),
        Container(width: 60.w, height: 14.h, color: Colors.white), // Label
        SizedBox(width: 8.w),
        Expanded(child: Container(height: 14.h, color: Colors.white)), // Value
      ],
    );
  }
}