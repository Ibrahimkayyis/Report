import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/repositories/teknisi_ticket_handling_repository.dart';

@lazySingleton
class GetTicketDetailUseCase {
  final TeknisiTicketHandlingRepository repository;

  GetTicketDetailUseCase(this.repository);

  Future<TeknisiTicketDetailModel> call(String ticketId) {
    return repository.getTicketDetail(ticketId);
  }
}