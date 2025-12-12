import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';

abstract class TeknisiTicketHandlingRemoteDataSource {
  Future<TeknisiTicketDetailModel> getTicketDetail(String ticketId);
  Future<void> startTicketProcess(String ticketId);
  Future<void> completeTicket(String ticketId);
}