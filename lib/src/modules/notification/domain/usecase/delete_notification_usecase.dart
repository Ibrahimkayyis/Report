import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class DeleteNotificationUseCase {
  final NotificationRepository repository;

  DeleteNotificationUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteNotification(id);
  }
}