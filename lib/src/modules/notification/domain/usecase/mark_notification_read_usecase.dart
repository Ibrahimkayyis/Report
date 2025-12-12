import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class MarkNotificationReadUseCase {
  final NotificationRepository repository;

  MarkNotificationReadUseCase(this.repository);

  Future<void> call(String id) {
    return repository.markAsRead(id);
  }
}