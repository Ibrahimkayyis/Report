import 'package:injectable/injectable.dart';

import '../repositories/teknisi_notification_repository.dart';

@lazySingleton
class MarkAllTeknisiNotificationsReadUseCase {
  final TeknisiNotificationRepository repository;

  MarkAllTeknisiNotificationsReadUseCase(this.repository);

  Future<void> call() {
    return repository.markAllAsRead();
  }
}