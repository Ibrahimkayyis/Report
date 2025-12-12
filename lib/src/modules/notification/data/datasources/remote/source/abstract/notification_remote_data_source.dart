import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  /// Mengambil semua notifikasi
  Future<List<NotificationModel>> getNotifications();

  /// Mengambil detail notifikasi
  Future<NotificationDetailModel> getNotificationDetail(String id);

  /// Tandai satu notifikasi sudah dibaca
  Future<void> markAsRead(String id);

  /// Tandai SEMUA notifikasi sudah dibaca
  Future<void> markAllAsRead();

  Future<void> deleteNotification(String id);
}