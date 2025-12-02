import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/widgets/widgets.dart';
import '../widgets/notification_detail_card.dart';

@RoutePage()
class NotificationDetailScreen extends StatelessWidget {
  final int id;

  const NotificationDetailScreen({
    super.key,
    required this.id,
  });

  // ✅ LOGIC DATA DUMMY YANG SUDAH DIPERBAIKI (SINKRON DENGAN LIST)
  Map<String, dynamic> _getDetailById(int id) {
    
    // -------------------------------------------------------------------------
    // KASUS 1: TIKET DIBUAT (Sesuai List Item 1)
    // -------------------------------------------------------------------------
    if (id == 1) {
      return {
        'title': 'Tiket Dibuat',
        'tag': 'Tiket',
        'time': '1 jam yang lalu',
        'type': 'ticket',
        'cardData': {
          'ticketNumber': 'LPR318728',
          'serviceType': 'Pelaporan Online',
          'opd': 'Dinas Pendidikan',
          'illustrationLabel': 'Laporan Anda Telah Berhasil Dikirim',
        },
        'content': {
          'header': 'Tiket berhasil dibuat',
          'body':
              'Laporan Anda telah berhasil direkam dalam sistem dengan nomor tiket #LPR318728.\nMohon simpan nomor ini untuk melacak status penyelesaian.\nTim kami akan segera menindaklanjuti laporan Anda.\n\nJenis Layanan: Pelaporan Online\nOPD Tujuan: Dinas Pendidikan',
          'footerLink': 'Cek Status Layanan',
        }
      };
    } 
    
    // -------------------------------------------------------------------------
    // KASUS 2: STATUS DIPERBARUI (Sesuai List Item 2)
    // -------------------------------------------------------------------------
    else if (id == 2) {
      return {
        'title': 'Status Tiket Diperbarui',
        'tag': 'Status',
        'time': '2 hari yang lalu',
        'type': 'update',
        'cardData': {
          'ticketNumber': 'LPR318728',
          'status': 'Pending', // Warna kuning
          'serviceType': 'Pelaporan Online',
          'opd': 'Dinas Pendidikan',
          'illustrationLabel': 'Status Tiket Diperbarui',
        },
        'content': {
          'header': 'Laporan Anda sedang kami tangani!',
          'body':
              'Tiket #LPR318728 kini sedang diproses oleh tim teknis.\nKami akan segera memberi kabar setelah ada pembaruan status berikutnya.\n\nJenis Layanan: Pelaporan Online\nOPD Tujuan: Dinas Pendidikan',
          'footerLink': 'Cek Status Layanan',
        }
      };
    } 
    
    // -------------------------------------------------------------------------
    // KASUS 3: MAINTENANCE (Sesuai List Item 3)
    // -------------------------------------------------------------------------
    else if (id == 3) {
      return {
        'title': 'Maintenance',
        'tag': 'Pengumuman',
        'tag2': 'Maintenance',
        'time': '4 hari yang lalu',
        'type': 'maintenance',
        'cardData': {
          'illustrationLabel': 'Maintenance',
        },
        'content': {
          'header': 'Pengumuman Maintenance Terjadwal',
          'body':
              'Dalam rangka meningkatkan kinerja dan keamanan sistem, Service Desk akan menjalani pemeliharaan (maintenance) pada:\n\n📅 Tanggal: 5 November 2025\n⏰ Waktu: 08.00 - 16.00 WIB\n\nSelama waktu tersebut, akses ke sistem Service Desk mungkin terbatas.\nDisarankan untuk menyelesaikan aktivitas sebelum jadwal tersebut.\n\nTerima kasih atas pengertian Anda.',
        }
      };
    } 
    
    // -------------------------------------------------------------------------
    // KASUS 4: UMUM / HUT (Sesuai List Item 4)
    // -------------------------------------------------------------------------
    else if (id == 4) {
      return {
        'title': 'Umum',
        'tag': 'Pengumuman',
        'tag2': 'Umum',
        'time': '5 bulan yang lalu',
        'type': 'announcement',
        'cardData': {
          'illustrationLabel': 'Dirgahayu Kota Surabaya Ke-727 #Surabaya727',
        },
        'content': {
          'header': 'Peringatan Hari Jadi Kota Surabaya ke-727',
          'body':
              'Dalam rangka memperingati Hari Jadi Kota Surabaya yang ke-727, kami mengajak seluruh pegawai, mitra, dan masyarakat Surabaya untuk bersama-sama memeriahkan momentum istimewa ini dengan semangat "Surabaya Hebat, Tangguh, dan Berdaya Saing".\n\nBerbagai kegiatan akan diselenggarakan sepanjang bulan Mei, antara lain:\n🏛️ Upacara peringatan Hari Jadi Kota Surabaya di Balai Kota.\n🎭 Festival budaya dan pameran UMKM Surabaya.\n🌳 Gerakan bersih lingkungan serentak di 31 kecamatan.\n🎉 Malam puncak perayaan dengan konser rakyat di Taman Surya.\n\nSelamat Hari Jadi Kota Surabaya ke-727! 💚',
        }
      };
    } 
    
    // -------------------------------------------------------------------------
    // KASUS 5: DARURAT (Sesuai List Item 5)
    // -------------------------------------------------------------------------
    else {
      return {
        'title': 'Darurat',
        'tag': 'Pengumuman',
        'tag2': 'Darurat',
        'time': '4 hari yang lalu',
        'type': 'emergency',
        'cardData': {
          'illustrationLabel': 'Darurat',
        },
        'content': {
          'header': 'Gangguan Jaringan Pusat',
          'body':
              'Kami informasikan bahwa saat ini terjadi gangguan jaringan pada pusat data kota yang berdampak pada akses layanan tiket dan sistem internal di seluruh OPD. Akibat gangguan ini, perhitungan SLA (Service Level Agreement) untuk seluruh tiket dihentikan sementara hingga sistem kembali normal.\n\nTim teknis pusat saat ini sedang melakukan investigasi dan pemulihan jaringan secara menyeluruh.\nPerkiraan waktu pemulihan akan diinformasikan kembali setelah proses perbaikan mencapai tahap stabil.\n\nTerima kasih atas pengertian dan kerja samanya.',
        }
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _getDetailById(id);
    final cardData = data['cardData'] as Map<String, dynamic>;
    final content = data['content'] as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: "Detail Notifikasi"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. JUDUL HALAMAN & TAG
            Text(
              data['title'],
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: ColorName.textPrimary,
              ),
            ),
            SizedBox(height: 8.h),

            // Row Tag + Time
            Row(
              children: [
                _buildTag(data['tag'], data['type']),
                if (data['tag2'] != null) ...[
                  SizedBox(width: 6.w),
                  _buildTag(data['tag2'], data['type']),
                ],
                const Spacer(),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            // 2. CARD UTAMA (Visualisasi Data)
            NotificationDetailCard(
              type: data['type'],
              ticketNumber: cardData['ticketNumber'],
              status: cardData['status'],
              serviceType: cardData['serviceType'],
              opdDestination: cardData['opd'],
              illustrationLabel: cardData['illustrationLabel'],
            ),

            SizedBox(height: 32.h),

            // 3. KONTEN DETAIL TEKS
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: _getIconForHeader(data['type']),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    content['header'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorName.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Body Paragraph
            Text(
              content['body'],
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorName.textPrimary.withOpacity(0.8),
                height: 1.5,
              ),
            ),

            // Link Footer (Cek Status)
            if (content.containsKey('footerLink')) ...[
              SizedBox(height: 20.h),
              Text(
                "Anda dapat memantau progres tiket di menu ${content['footerLink']}.",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
              ),
              GestureDetector(
                onTap: () {
                  // Navigasi ke Tracking
                },
                child: Text(
                  content['footerLink'],
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorName.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, String type) {
    Color color;
    switch (text.toLowerCase()) {
      case 'tiket':
        color = ColorName.primary;
        break;
      case 'status':
        color = ColorName.primary;
        break;
      case 'pengumuman':
        color = const Color(0xFF1F4E79);
        break; // Navy Blue (sesuai gambar)
      case 'maintenance':
        color = const Color(0xFF1F4E79);
        break;
      case 'umum':
        color = const Color(0xFF1F4E79);
        break;
      case 'darurat':
        color = const Color(0xFF1F4E79);
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _getIconForHeader(String type) {
    IconData icon;
    Color color = ColorName.textPrimary;

    switch (type) {
      case 'ticket':
        icon = Icons.check_box;
        color = Colors.green; // Icon Checkbox Hijau
        break;
      case 'update':
        icon = Icons.build_circle_outlined;
        color = Colors.grey; // Icon Palu/Wrench
        break;
      case 'maintenance':
        icon = Icons.campaign; // Megaphone
        break;
      case 'announcement':
        icon = Icons.celebration; // Birthday
        break;
      case 'emergency':
        icon = Icons.warning_amber_rounded; // Segitiga Warning
        color = Colors.amber;
        break;
      default:
        icon = Icons.article;
    }
    return Icon(icon, size: 24.sp, color: color);
  }
}