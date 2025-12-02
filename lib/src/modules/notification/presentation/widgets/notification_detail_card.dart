import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class NotificationDetailCard extends StatelessWidget {
  final String type; // 'ticket', 'maintenance', 'announcement', 'emergency'
  final String? ticketNumber;
  final String? status;
  final String? serviceType;
  final String? opdDestination;
  final String? illustrationLabel; // Label di bawah gambar (misal: "Maintenance")

  const NotificationDetailCard({
    super.key,
    required this.type,
    this.ticketNumber,
    this.status,
    this.serviceType,
    this.opdDestination,
    this.illustrationLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // 1. ILUSTRASI / ICON UTAMA
          _buildIllustration(),

          SizedBox(height: 16.h),

          // 2. JUDUL / LABEL UTAMA
          Text(
            _getMainTitle(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
          ),

          SizedBox(height: 8.h),

          // 3. DESKRIPSI SINGKAT (Khusus Tiket)
          if (type == 'ticket' || type == 'update') ...[
            Text(
              type == 'ticket'
                  ? "Laporan Anda telah berhasil dikirim."
                  : "Status laporan Anda telah diperbarui.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
            ),
            SizedBox(height: 24.h),
            
            // TIKET NUMBER BOX
            Column(
              children: [
                Text("No. Tiket:", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                SizedBox(height: 6.h),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: ColorName.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    ticketNumber ?? "-",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),

            // STATUS CHIP (Jika ada)
            if (status != null) ...[
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Status: ", style: TextStyle(fontSize: 14.sp)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status!),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      status!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],

            SizedBox(height: 24.h),

            // INFO DETAIL (Layanan & OPD)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(Icons.assignment, "Jenis Layanan", serviceType ?? "-"),
                _buildInfoItem(Icons.location_city, "OPD Tujuan", opdDestination ?? "-"),
              ],
            ),

            SizedBox(height: 16.h),
            
            // DOWNLOAD BUTTON
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.download, size: 18.sp, color: ColorName.textPrimary),
              label: Text(
                "Unduh Tiket",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorName.textPrimary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ] else ...[
            // UNTUK MAINTENANCE / ANNOUNCEMENT
            SizedBox(height: 100.h), // Placeholder space agar mirip desain web
            // Disini bisa ditambahkan elemen visual lain jika perlu
          ],
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    IconData icon;
    Color color;

    switch (type) {
      case 'maintenance':
        icon = Icons.construction; // 🚧
        color = Colors.orange;
        break;
      case 'emergency':
        icon = Icons.warning_amber_rounded; // ⚠️
        color = Colors.red;
        break;
      case 'announcement':
        icon = Icons.celebration; // 🎉 (Contoh HUT)
        color = Colors.teal;
        break;
      default: // Ticket
        icon = Icons.mark_email_read; // ✅
        color = ColorName.primary;
    }

    return Container(
      height: 80.w,
      width: 80.w,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 40.sp, color: color),
    );
  }

  String _getMainTitle() {
    if (illustrationLabel != null) return illustrationLabel!;
    switch (type) {
      case 'ticket': return "Laporan Terkirim";
      case 'update': return "Status Diperbarui";
      case 'maintenance': return "Maintenance System";
      case 'emergency': return "Darurat";
      default: return "Informasi";
    }
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.grey, size: 20.sp),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
          SizedBox(height: 2.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending': return Colors.amber;
      case 'selesai': return Colors.greenAccent;
      case 'proses': return Colors.blueAccent;
      case 'ditolak': return Colors.redAccent;
      default: return Colors.grey.shade300;
    }
  }
}