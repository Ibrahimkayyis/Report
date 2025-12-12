import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/repositories/teknisi_ticket_handling_repository.dart';

@lazySingleton
class CompleteTicketUseCase {
  final TeknisiTicketHandlingRepository repository;

  CompleteTicketUseCase(this.repository);

  Future<void> call(String ticketId) {
    return repository.completeTicket(ticketId);
  }
}