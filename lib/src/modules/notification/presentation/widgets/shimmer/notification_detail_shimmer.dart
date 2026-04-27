import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class NotificationDetailShimmer extends StatelessWidget {
  const NotificationDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header (Title + Tag)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 150.w, height: 20.h, color: Colors.white),
                        SizedBox(height: 8.h),
                        Container(
                          width: 60.w, 
                          height: 24.h, 
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ],
                    ),
                    Container(width: 80.w, height: 14.h, color: Colors.white),
                  ],
                ),

                SizedBox(height: 24.h),

                // 2. MAIN CARD SHIMMER
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      // Ilustrasi (Lingkaran)
                      Container(
                        height: 80.w,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Judul Utama
                      Container(width: 180.w, height: 20.h, color: Colors.white),
                      SizedBox(height: 24.h),

                      // "Pengaduan Anda:"
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(width: 100.w, height: 14.h, color: Colors.white),
                      ),
                      SizedBox(height: 12.h),

                      // Ticket Row
                      Row(
                        children: [
                          Container(width: 60.w, height: 14.h, color: Colors.white),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),

                      // Status Row
                      Row(
                        children: [
                          Container(width: 60.w, height: 14.h, color: Colors.white),
                          SizedBox(width: 16.w),
                          Container(
                            width: 100.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),
                      Divider(color: Colors.white),
                      SizedBox(height: 24.h),

                      // Jenis Layanan & OPD
                      Row(
                        children: [
                          Expanded(child: _buildDetailColumnShimmer()),
                          SizedBox(width: 16.w),
                          Expanded(child: _buildDetailColumnShimmer()),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                // 3. FOOTER MESSAGE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24.w, 
                      height: 24.w, 
                      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 120.w, height: 16.h, color: Colors.white),
                          SizedBox(height: 8.h),
                          Container(width: double.infinity, height: 14.h, color: Colors.white),
                          SizedBox(height: 4.h),
                          Container(width: 200.w, height: 14.h, color: Colors.white),
                          
                          SizedBox(height: 16.h),
                          
                          // Small Info Rows
                          _buildSmallInfoShimmer(),
                          SizedBox(height: 4.h),
                          _buildSmallInfoShimmer(),
                          
                          SizedBox(height: 20.h),
                          Container(width: 100.w, height: 14.h, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailColumnShimmer() {
    return Row(
      children: [
        Container(width: 36.w, height: 36.w, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 60.w, height: 10.h, color: Colors.white),
              SizedBox(height: 4.h),
              Container(width: 80.w, height: 12.h, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallInfoShimmer() {
    return Row(
      children: [
        Container(width: 80.w, height: 12.h, color: Colors.white),
        SizedBox(width: 4.w),
        Expanded(child: Container(height: 12.h, color: Colors.white)),
      ],
    );
  }
}