import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/repositories/teknisi_ticket_handling_repository.dart';

@lazySingleton
class StartTicketProcessUseCase {
  final TeknisiTicketHandlingRepository repository;

  StartTicketProcessUseCase(this.repository);

  Future<void> call(String ticketId) {
    return repository.startTicketProcess(ticketId);
  }
}