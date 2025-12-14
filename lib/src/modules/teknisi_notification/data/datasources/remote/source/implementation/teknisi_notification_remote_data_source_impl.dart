import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../abstract/teknisi_notification_remote_data_source.dart';

@LazySingleton(as: TeknisiNotificationRemoteDataSource)
class TeknisiNotificationRemoteDataSourceImpl
    implements TeknisiNotificationRemoteDataSource {
  final Dio _dioClient;

  TeknisiNotificationRemoteDataSourceImpl(this._dioClient);

  @override
  Future<Map<String, dynamic>> fetchNotifications() async {
    try {
      final response = await _dioClient.get(
        '/api/notifications/teknisi',
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> fetchNotificationDetail(String id) async {
    try {
      final response = await _dioClient.get(
        '/api/notifications/teknisi/$id',
      );
      
      // Note: Berdasarkan dokumentasi, data detail ada di dalam key 'data'
      // JSON: { "status": "success", "data": { ... } }
      // Kita kembalikan isi 'data'-nya agar pas dengan Mapper
      return response.data['data'] as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNotification(String id) async {
    try {
      await _dioClient.delete(
        '/api/notifications/teknisi/$id',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAllAsRead() async {
    try {
      await _dioClient.patch(
        '/api/notifications/teknisi/read-all',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAsRead(String id) async {
    try {
      await _dioClient.patch(
        '/api/notifications/teknisi/$id/read',
      );
    } catch (e) {
      rethrow;
    }
  }
}