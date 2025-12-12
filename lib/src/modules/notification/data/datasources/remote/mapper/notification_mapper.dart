import 'package:flutter/material.dart'; // Opsional: Jika ingin menyediakan helper icon
import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';

class NotificationMapper {
  
  // --- MAPPING LIST ---
  static NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['notification_id'] as String? ?? '',
      ticketId: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '',
      requestType: json['request_type'] as String? ?? '',
      opdId: json['opd_id_tiket'] as String? ?? '',
      opdName: json['nama_dinas'] as String? ?? '',
      rejectionReason: json['rejection_reason_seksi'] as String?,
      statusTicket: json['status_ticket_pengguna'] as String? ?? '',
      message: json['message'] as String? ?? '',
      isRead: json['is_read'] as bool? ?? false,
      // ✅ Logika Konversi Waktu
      createdAt: _formatTimeAgo(json['created_at'] as String?),
    );
  }

  // --- MAPPING DETAIL ---
  static NotificationDetailModel fromDetailJson(Map<String, dynamic> json) {
    // API kadang membungkus dalam object 'data', kadang langsung field. 
    // Mapper ini mengasumsikan input 'json' adalah object data intinya.
    
    return NotificationDetailModel(
      id: json['notification_id'] as String? ?? '',
      ticketId: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '',
      requestType: json['request_type'] as String? ?? '',
      opdId: json['opd_id_tiket'] as String? ?? '',
      opdName: json['nama_dinas'] as String? ?? '',
      rejectionReason: json['rejection_reason_seksi'] as String?,
      statusTicket: json['status_ticket_pengguna'] as String? ?? '',
      message: json['message'] as String? ?? '',
      isRead: json['is_read'] as bool? ?? false,
      // ✅ Logika Konversi Waktu
      createdAt: _formatTimeAgo(json['created_at'] as String?),
    );
  }

  // --- LOGIKA TIME AGO ---
  static String _formatTimeAgo(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '-';

    try {
      final dateTime = DateTime.parse(dateString); // Parse ISO 8601
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 365) {
        return '${(difference.inDays / 365).floor()} tahun yang lalu';
      } else if (difference.inDays > 30) {
        return '${(difference.inDays / 30).floor()} bulan yang lalu';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} hari yang lalu';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} jam yang lalu';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} menit yang lalu';
      } else {
        return 'Baru saja';
      }
    } catch (e) {
      return dateString; // Fallback jika format salah
    }
  }

  // --- HELPER UNTUK MEMILIH ICON (Bisa dipanggil di UI) ---
  // Static helper ini tidak masuk ke Model, tapi bisa digunakan oleh UI
  // berdasarkan data 'requestType' atau 'message' dari Model.
  static IconData getIcon(String requestType, String message) {
    final typeLower = requestType.toLowerCase();
    final msgLower = message.toLowerCase();

    // 1. Notifikasi Maintenance / Darurat
    if (typeLower == 'maintenance') {
      return Icons.construction_outlined;
    }
    if (typeLower == 'emergency' || typeLower == 'darurat') {
      return Icons.warning_amber_rounded;
    }
    if (typeLower == 'announcement' || typeLower == 'umum') {
      return Icons.celebration_outlined;
    }

    // 2. Notifikasi Tiket (Berdasarkan isi pesan)
    if (msgLower.contains('berubah') || msgLower.contains('status')) {
      // Status Update
      return Icons.assignment_turned_in_outlined;
    }
    
    // Default: Tiket Baru / Info Tiket
    return Icons.mark_email_read_outlined;
  }
}