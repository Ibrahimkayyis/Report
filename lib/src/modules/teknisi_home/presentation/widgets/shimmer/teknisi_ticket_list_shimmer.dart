import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class TeknisiTicketListShimmer extends StatelessWidget {
  const TeknisiTicketListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
          padding: EdgeInsets.only(right: 8.w),
          itemCount: 4, // Menampilkan 4 item dummy
          itemBuilder: (context, index) {
            return _buildShimmerItem();
          },
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (User Info & Status)
          Row(
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 120.w, height: 14.h, color: Colors.white),
                    SizedBox(height: 4.h),
                    Container(width: 80.w, height: 12.h, color: Colors.white),
                  ],
                ),
              ),
              Container(
                width: 60.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // 2. Info Chips (2 Baris)
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              Container(width: 80.w, height: 20.h, color: Colors.white),
              Container(width: 100.w, height: 20.h, color: Colors.white),
              Container(width: 60.w, height: 20.h, color: Colors.white),
            ],
          ),

          SizedBox(height: 12.h),

          // 3. Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 80.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}