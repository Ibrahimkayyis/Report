import 'package:injectable/injectable.dart';

import '../models/notification_meta_model.dart';
import '../repositories/teknisi_notification_repository.dart';

@lazySingleton
class GetTeknisiNotificationsUseCase {
  final TeknisiNotificationRepository repository;

  GetTeknisiNotificationsUseCase(this.repository);

  Future<TeknisiNotificationListModel> call() {
    return repository.getNotifications();
  }
}