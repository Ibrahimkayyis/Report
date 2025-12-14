import '../models/notification_meta_model.dart';
import '../models/teknisi_notification_detail_model.dart';

abstract class TeknisiNotificationRepository {
  /// Mengambil daftar notifikasi beserta jumlah total & unread
  Future<TeknisiNotificationListModel> getNotifications();

  /// Mengambil detail lengkap satu notifikasi
  Future<TeknisiNotificationDetailModel> getNotificationDetail(String id);

  /// Menandai satu notifikasi sebagai sudah dibaca
  Future<void> markAsRead(String id);

  /// Menandai semua notifikasi sebagai sudah dibaca
  Future<void> markAllAsRead();

  /// Menghapus satu notifikasi
  Future<void> deleteNotification(String id);
}