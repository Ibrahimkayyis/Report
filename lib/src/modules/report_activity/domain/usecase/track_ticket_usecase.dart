import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';
import 'package:report/src/modules/report_activity/domain/repositories/report_activity_repository.dart';

@injectable
class TrackTicketUseCase {
  final ReportActivityRepository repository;

  TrackTicketUseCase(this.repository);

  Future<TrackTicketModel> call(String ticketCode) {
    return repository.trackTicket(ticketCode: ticketCode);
  }
}