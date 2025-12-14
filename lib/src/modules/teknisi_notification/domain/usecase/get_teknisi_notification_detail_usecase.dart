import 'package:injectable/injectable.dart';

import '../models/teknisi_notification_detail_model.dart';
import '../repositories/teknisi_notification_repository.dart';

@lazySingleton
class GetTeknisiNotificationDetailUseCase {
  final TeknisiNotificationRepository repository;

  GetTeknisiNotificationDetailUseCase(this.repository);

  Future<TeknisiNotificationDetailModel> call(String id) {
    return repository.getNotificationDetail(id);
  }
}