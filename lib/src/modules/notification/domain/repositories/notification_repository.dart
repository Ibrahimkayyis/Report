import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';

abstract class NotificationRepository {
  /// Mengambil daftar semua notifikasi (GET /api/notifications)
  Future<List<NotificationModel>> getNotifications();

  /// Mengambil detail notifikasi spesifik (GET /api/notifications/{id})
  Future<NotificationDetailModel> getNotificationDetail(String id);

  /// Menandai satu notifikasi sudah dibaca (PATCH /api/notifications/{id}/read)
  Future<void> markAsRead(String id);

  /// Menandai SEMUA notifikasi sudah dibaca (PATCH /api/notifications/read-all)
  Future<void> markAllAsRead();

  Future<void> deleteNotification(String id);
}