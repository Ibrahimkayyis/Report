import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';
import 'package:report/src/modules/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<List<NotificationModel>> call() {
    return repository.getNotifications();
  }
}