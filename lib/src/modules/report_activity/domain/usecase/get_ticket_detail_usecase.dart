import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';
import 'package:report/src/modules/report_activity/domain/repositories/report_activity_repository.dart';

@lazySingleton
class GetTicketDetailUseCase {
  final ReportActivityRepository repository;

  GetTicketDetailUseCase(this.repository);

  Future<TicketDetailModel> call({
    required String ticketId,
    required UserType userType,
  }) {
    return repository.getTicketDetail(ticketId: ticketId, userType: userType);
  }
}