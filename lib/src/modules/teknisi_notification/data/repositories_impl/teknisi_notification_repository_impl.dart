import 'package:injectable/injectable.dart';

import '../../domain/models/notification_meta_model.dart';
import '../../domain/models/teknisi_notification_detail_model.dart';
import '../../domain/repositories/teknisi_notification_repository.dart';
import '../datasources/remote/mapper/teknisi_notification_mapper.dart';
import '../datasources/remote/source/abstract/teknisi_notification_remote_data_source.dart';

@LazySingleton(as: TeknisiNotificationRepository)
class TeknisiNotificationRepositoryImpl implements TeknisiNotificationRepository {
  final TeknisiNotificationRemoteDataSource remoteDataSource;

  TeknisiNotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<TeknisiNotificationListModel> getNotifications() async {
    try {
      // 1. Ambil data mentah (Map<String, dynamic>) dari Remote Source
      final response = await remoteDataSource.fetchNotifications();
      
      // 2. Konversi ke Domain Model menggunakan Mapper
      return TeknisiNotificationMapper.mapToListResponse(response);
    } catch (e) {
      // 3. Lempar error agar bisa ditangani di Cubit (UI Layer)
      rethrow;
    }
  }

  @override
  Future<TeknisiNotificationDetailModel> getNotificationDetail(String id) async {
    try {
      final response = await remoteDataSource.fetchNotificationDetail(id);
      return TeknisiNotificationMapper.mapToDetail(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNotification(String id) async {
    try {
      await remoteDataSource.deleteNotification(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAllAsRead() async {
    try {
      await remoteDataSource.markAllAsRead();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAsRead(String id) async {
    try {
      await remoteDataSource.markAsRead(id);
    } catch (e) {
      rethrow;
    }
  }
}