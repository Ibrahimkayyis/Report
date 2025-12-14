import '../../../../domain/models/notification_meta_model.dart';
import '../../../../domain/models/teknisi_notification_detail_model.dart';
import '../../../../domain/models/teknisi_notification_model.dart';

class TeknisiNotificationMapper {
  /// Mengubah JSON Response (List) menjadi Domain Model [TeknisiNotificationListModel]
  static TeknisiNotificationListModel mapToListResponse(Map<String, dynamic> json) {
    return TeknisiNotificationListModel(
      totalNotifications: json['total_notifications'] as int? ?? 0,
      unreadNotifications: json['unread_notifications'] as int? ?? 0,
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((e) => _mapToItem(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  /// Helper untuk memetakan satu item notifikasi dalam list
  static TeknisiNotificationModel _mapToItem(Map<String, dynamic> json) {
    return TeknisiNotificationModel(
      id: json['notification_id'] as String? ?? '',
      ticketId: json['ticket_id'] as String?, // Bisa null
      message: json['message'] as String? ?? '',
      status: json['status'] as String?, // Bisa null
      isRead: json['is_read'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
    );
  }

  /// Mengubah JSON Object (Detail) menjadi Domain Model [TeknisiNotificationDetailModel]
  /// Note: Input `json` diasumsikan adalah object yang ada di dalam key "data"
  static TeknisiNotificationDetailModel mapToDetail(Map<String, dynamic> json) {
    return TeknisiNotificationDetailModel(
      id: json['notification_id'] as String? ?? '',
      ticketId: json['ticket_id'] as String?,
      ticketCode: json['ticket_code'] as String?, // Field khusus detail
      message: json['message'] as String? ?? '',
      status: json['status'] as String?,
      isRead: json['is_read'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
    );
  }
}