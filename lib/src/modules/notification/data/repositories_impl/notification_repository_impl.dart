import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/data/datasources/remote/source/abstract/notification_remote_data_source.dart';
import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';
import 'package:report/src/modules/notification/domain/repositories/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      return await remoteDataSource.getNotifications();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NotificationDetailModel> getNotificationDetail(String id) async {
    try {
      return await remoteDataSource.getNotificationDetail(id);
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

  @override
  Future<void> markAllAsRead() async {
    try {
      await remoteDataSource.markAllAsRead();
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
}