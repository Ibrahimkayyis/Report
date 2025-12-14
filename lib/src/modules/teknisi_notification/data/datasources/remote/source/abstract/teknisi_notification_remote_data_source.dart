abstract class TeknisiNotificationRemoteDataSource {
  /// GET /api/notifications/teknisi
  Future<Map<String, dynamic>> fetchNotifications();

  /// GET /api/notifications/teknisi/{id}
  Future<Map<String, dynamic>> fetchNotificationDetail(String id);

  /// PATCH /api/notifications/teknisi/{id}/read
  Future<void> markAsRead(String id);

  /// PATCH /api/notifications/teknisi/read-all
  Future<void> markAllAsRead();

  /// DELETE /api/notifications/teknisi/{id}
  Future<void> deleteNotification(String id);
}