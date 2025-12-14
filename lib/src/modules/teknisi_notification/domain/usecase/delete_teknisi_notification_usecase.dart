import 'package:injectable/injectable.dart';

import '../repositories/teknisi_notification_repository.dart';

@lazySingleton
class DeleteTeknisiNotificationUseCase {
  final TeknisiNotificationRepository repository;

  DeleteTeknisiNotificationUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteNotification(id);
  }
}