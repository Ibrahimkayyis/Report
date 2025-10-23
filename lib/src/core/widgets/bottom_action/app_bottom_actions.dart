import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

/// 🌐 Widget global untuk action di bagian bawah screen.
///
/// Dapat digunakan di berbagai context, misalnya:
/// - Laporan sukses (`Check Status`, `Buat Laporan Baru`, `Kembali ke Beranda`)
/// - Permohonan layanan sukses (`Cek Status Layanan`, `Buat Permohonan Baru`, dsb)
///
/// Setiap teks tombol bisa dikustomisasi agar fleksibel.
class AppBottomActions extends StatelessWidget {
  /// Tombol utama (biasanya paling atas)
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;

  /// Tombol sekunder kiri (biasanya di bawah, kiri)
  final String secondaryLeftLabel;
  final VoidCallback onSecondaryLeftPressed;

  /// Tombol sekunder kanan (biasanya di bawah, kanan)
  final String secondaryRightLabel;
  final VoidCallback onSecondaryRightPressed;

  /// Opsional: jika ingin mengubah warna tombol utama
  final Color? primaryColor;

  /// Opsional: ubah warna tombol sekunder kiri/kanan
  final Color? secondaryLeftColor;
  final Color? secondaryRightColor;

  const AppBottomActions({
    super.key,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    required this.secondaryLeftLabel,
    required this.onSecondaryLeftPressed,
    required this.secondaryRightLabel,
    required this.onSecondaryRightPressed,
    this.primaryColor,
    this.secondaryLeftColor,
    this.secondaryRightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔹 Primary Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPrimaryPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor ?? ColorName.primary,
                  foregroundColor: ColorName.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  primaryLabel,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // 🔹 Secondary Buttons (Row)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onSecondaryLeftPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                          secondaryLeftColor ?? ColorName.primary,
                      side: BorderSide(
                        color: secondaryLeftColor ?? ColorName.primary,
                        width: 1.5.w,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      secondaryLeftLabel,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onSecondaryRightPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                          secondaryRightColor ?? Colors.grey.shade700,
                      side: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.5.w,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      secondaryRightLabel,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
