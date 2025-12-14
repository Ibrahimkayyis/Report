import 'package:injectable/injectable.dart';

import '../repositories/teknisi_notification_repository.dart';

@lazySingleton
class MarkTeknisiNotificationReadUseCase {
  final TeknisiNotificationRepository repository;

  MarkTeknisiNotificationReadUseCase(this.repository);

  Future<void> call(String id) {
    return repository.markAsRead(id);
  }
}