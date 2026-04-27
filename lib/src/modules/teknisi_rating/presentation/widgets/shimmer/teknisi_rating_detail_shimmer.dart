import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class TeknisiRatingDetailShimmer extends StatelessWidget {
  const TeknisiRatingDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Pengirim Section
                      _buildTitlePlaceholder(),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 20.r, backgroundColor: Colors.white),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(width: 100.w, height: 14.h, color: Colors.white),
                                SizedBox(height: 4.h),
                                Container(width: 150.w, height: 12.h, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 20.h),

                      // 2. ID Tiket
                      _buildTitlePlaceholder(),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // 3. Detail Tiket (Simulasi Expanded)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(width: 100.w, height: 14.h, color: Colors.white),
                                Icon(Icons.keyboard_arrow_up, color: Colors.white),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            // Isi detail dummy
                            _buildDetailRow(),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Expanded(child: _buildDetailRow()),
                                SizedBox(width: 12.w),
                                Expanded(child: _buildDetailRow()),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            _buildDetailRow(),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // 4. Rating Stars
                      _buildTitlePlaceholder(),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Icon(Icons.star, color: Colors.white, size: 48.sp),
                        )),
                      ),

                      SizedBox(height: 24.h),

                      // 5. Komentar
                      _buildTitlePlaceholder(),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // 6. Sub Ratings
                      _buildSubRatingShimmer(),
                      SizedBox(height: 16.h),
                      _buildSubRatingShimmer(),
                      SizedBox(height: 16.h),
                      _buildSubRatingShimmer(),
                    ],
                  ),
                ),
              ),

              // Bottom Button Shimmer
              Container(
                padding: EdgeInsets.all(16.w),
                color: Colors.white,
                child: Container(
                  height: 48.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitlePlaceholder() {
    return Container(
      width: 120.w,
      height: 14.h,
      color: Colors.white,
    );
  }

  Widget _buildDetailRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 80.w, height: 10.h, color: Colors.white),
        SizedBox(height: 4.h),
        Container(width: double.infinity, height: 30.h, color: Colors.white),
      ],
    );
  }

  Widget _buildSubRatingShimmer() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(child: Container(height: 14.h, color: Colors.white)),
          SizedBox(width: 12.w),
          Container(width: 100.w, height: 20.h, color: Colors.white),
        ],
      ),
    );
  }
}