import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/domain/repositories/report_activity_repository.dart';

@injectable
class GetFinishedActivitiesUseCase {
  final ReportActivityRepository repository;

  GetFinishedActivitiesUseCase(this.repository);

  Future<List<ActivityModel>> call() {
    return repository.getFinishedActivities();
  }
}