import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';
import 'package:report/src/modules/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class GetNotificationDetailUseCase {
  final NotificationRepository repository;

  GetNotificationDetailUseCase(this.repository);

  Future<NotificationDetailModel> call(String id) {
    return repository.getNotificationDetail(id);
  }
}