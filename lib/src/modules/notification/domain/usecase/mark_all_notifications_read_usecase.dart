import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class MarkAllNotificationsReadUseCase {
  final NotificationRepository repository;

  MarkAllNotificationsReadUseCase(this.repository);

  Future<void> call() {
    return repository.markAllAsRead();
  }
}