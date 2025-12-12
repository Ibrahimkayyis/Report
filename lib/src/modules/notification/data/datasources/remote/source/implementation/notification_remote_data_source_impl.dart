import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/notification/data/datasources/remote/mapper/notification_mapper.dart';
import 'package:report/src/modules/notification/data/datasources/remote/source/abstract/notification_remote_data_source.dart';
import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';

@LazySingleton(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio dio;

  NotificationRemoteDataSourceImpl(this.dio);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      const endpoint = '/api/notifications';
      AppLogger.i("📡 Fetching Notifications: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        // Struktur: { "status": "success", "count": 49, "data": [...] }
        final List dataList = response.data['data'] as List;
        
        return dataList
            .map((json) => NotificationMapper.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      throw Exception('Failed to load notifications: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch notifications", e);
      rethrow;
    }
  }

  @override
  Future<NotificationDetailModel> getNotificationDetail(String id) async {
    try {
      final endpoint = '/api/notifications/$id';
      AppLogger.i("🔍 Fetching Notification Detail: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        // Struktur: { "status": "success", "data": { ... } }
        final data = response.data['data'] as Map<String, dynamic>;
        return NotificationMapper.fromDetailJson(data);
      }

      throw Exception('Failed to load notification detail: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch notification detail", e);
      
      if (e is DioException && e.response?.statusCode == 404) {
        throw Exception("Notifikasi tidak ditemukan");
      }
      
      rethrow;
    }
  }

  @override
  Future<void> markAsRead(String id) async {
    try {
      final endpoint = '/api/notifications/$id/read';
      // AppLogger.i("👀 Mark Read: $endpoint"); // Opsional, biar log gak penuh

      final response = await dio.patch(endpoint);

      if (response.statusCode == 200) {
        return;
      }
      
      throw Exception('Failed to mark as read: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal mark read notification $id", e);
      rethrow;
    }
  }

  @override
  Future<void> markAllAsRead() async {
    try {
      const endpoint = '/api/notifications/read-all';
      AppLogger.i("📚 Mark ALL Read: $endpoint");

      final response = await dio.patch(endpoint);

      if (response.statusCode == 200) {
        AppLogger.i("✅ All notifications marked as read");
        return;
      }

      throw Exception('Failed to mark all as read: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal mark all read", e);
      rethrow;
    }
  }

  @override
  Future<void> deleteNotification(String id) async {
    try {
      final endpoint = '/api/notifications/$id';
      AppLogger.i("🗑️ Deleting Notification: $endpoint");

      final response = await dio.delete(endpoint);

      if (response.statusCode == 200) {
        AppLogger.i("✅ Delete Sukses: ${response.data}");
        return;
      }

      throw Exception('Failed to delete notification: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal delete notification $id", e);
      rethrow;
    }
  }
}