import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';

abstract class TeknisiTicketHandlingRepository {
  /// Mengambil detail tiket spesifik
  /// Endpoint: GET /api/tickets/teknisi/{ticket_id}
  Future<TeknisiTicketDetailModel> getTicketDetail(String ticketId);

  /// Memulai pengerjaan tiket (Status -> Diproses)
  /// Endpoint: PUT /api/tickets/teknisi/{ticket_id}/process
  Future<void> startTicketProcess(String ticketId);

  /// Menyelesaikan pengerjaan tiket (Status -> Selesai)
  /// Endpoint: PUT /api/tickets/teknisi/{ticket_id}/complete
  Future<void> completeTicket(String ticketId);
}