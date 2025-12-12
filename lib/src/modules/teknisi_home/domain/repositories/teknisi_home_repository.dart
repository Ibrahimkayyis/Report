import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';

abstract class TeknisiHomeRepository {
  /// Mengambil daftar tiket yang ditugaskan ke teknisi yang sedang login.
  /// Endpoint: GET /api/tickets/teknisi
  Future<TeknisiTicketResponse> getTeknisiTickets();
}