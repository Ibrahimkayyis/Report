import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class TeknisiTicketDetailShimmer extends StatelessWidget {
  const TeknisiTicketDetailShimmer({super.key});

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
                            Container(width: 150.w, height: 14.h, color: Colors.white),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 20.h),

                      // 2. ID Laporan
                      _buildTitlePlaceholder(),
                      SizedBox(height: 8.h),
                      _buildFieldShimmer(),

                      SizedBox(height: 20.h),

                      // 3. Prioritas
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

                      // 4. Status Selector (3 Button Row)
                      _buildTitlePlaceholder(),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(child: _buildStatusButtonShimmer()),
                          SizedBox(width: 8.w),
                          Expanded(child: _buildStatusButtonShimmer()),
                          SizedBox(width: 8.w),
                          Expanded(child: _buildStatusButtonShimmer()),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      // 5. Judul Pelaporan
                      _buildTitlePlaceholder(),
                      SizedBox(height: 8.h),
                      _buildFieldShimmer(),

                      SizedBox(height: 20.h),

                      // 6. Kategori & Jenis Aset
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTitlePlaceholder(),
                                SizedBox(height: 8.h),
                                _buildFieldShimmer(),
                              ],
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTitlePlaceholder(),
                                SizedBox(height: 8.h),
                                _buildFieldShimmer(),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      // 7. Rincian Masalah (TextArea)
                      _buildTitlePlaceholder(),
                      SizedBox(height: 8.h),
                      _buildFieldShimmer(height: 100.h),
                    ],
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
      width: 100.w,
      height: 14.h,
      color: Colors.white,
    );
  }

  Widget _buildFieldShimmer({double height = 48.0}) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  Widget _buildStatusButtonShimmer() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}