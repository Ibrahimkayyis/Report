import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class RatingCardItem extends StatelessWidget {
  final String senderName;
  final String? senderAvatar; // ✅ UBAH JADI NULLABLE (String?)
  final String dateIn;
  final String dateOut;
  final String category;
  final String type;
  final String form;
  final int rating;
  final VoidCallback? onViewPressed;

  const RatingCardItem({
    super.key,
    required this.senderName,
    this.senderAvatar, // ✅ Tidak required lagi
    required this.dateIn,
    required this.dateOut,
    required this.category,
    required this.type,
    required this.form,
    required this.rating,
    this.onViewPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Cek validitas URL
    final bool hasAvatar = senderAvatar != null && senderAvatar!.isNotEmpty;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header: Avatar + Name + Rating
            Row(
              children: [
                /// Avatar
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: hasAvatar ? Colors.transparent : ColorName.primary.withOpacity(0.1),
                  // ✅ FIX: Hanya load NetworkImage jika URL valid
                  backgroundImage: hasAvatar ? NetworkImage(senderAvatar!) : null,
                  // ✅ FIX: Tampilkan Icon jika tidak ada gambar
                  child: hasAvatar 
                      ? null 
                      : Icon(Icons.person, color: ColorName.primary, size: 24.sp),
                ),
                SizedBox(width: 12.w),

                /// Name
                Expanded(
                  child: Text(
                    senderName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorName.textPrimary,
                    ),
                  ),
                ),

                /// Rating Stars
                _buildStarRating(rating),
              ],
            ),

            // ... (Sisa kode ke bawah SAMA, tidak perlu diubah) ...
            SizedBox(height: 16.h),
            _buildInfoRow(Icons.login, 'Masuk', dateIn),
            SizedBox(height: 8.h),
            _buildInfoRow(Icons.logout, 'Selesai', dateOut),
            SizedBox(height: 8.h),
            _buildInfoRow(Icons.category_outlined, 'Kategori', category),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(child: _buildInfoChip('Jenis', type)),
                SizedBox(width: 8.w),
                Expanded(child: _buildInfoChip('Bentuk', form)),
              ],
            ),
            SizedBox(height: 12.h),
            if (onViewPressed != null)
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: onViewPressed,
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: ColorName.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: ColorName.primary, width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.visibility_outlined, color: ColorName.primary, size: 18.sp),
                        SizedBox(width: 6.w),
                        Text(
                          'Lihat',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ... (Helper methods _buildStarRating, _buildInfoRow, _buildInfoChip SAMA) ...
  Widget _buildStarRating(int rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? ColorName.primary : Colors.grey.shade400,
          size: 18.sp,
        );
      }),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: Colors.grey.shade600),
        SizedBox(width: 8.w),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13.sp,
              color: ColorName.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600),
          ),
          SizedBox(height: 2.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 13.sp,
              color: ColorName.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}