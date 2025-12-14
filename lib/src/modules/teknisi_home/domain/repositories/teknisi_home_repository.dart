import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';
import '../models/teknisi_dashboard_summary_model.dart'; // 👈 Import Model Baru

abstract class TeknisiHomeRepository {
  /// Mengambil daftar tiket yang ditugaskan ke teknisi yang sedang login.
  /// Endpoint: GET /api/tickets/teknisi
  Future<TeknisiTicketResponse> getTeknisiTickets();

  /// Mengambil ringkasan statistik kinerja teknisi.
  /// Endpoint: GET /api/dashboard/teknisi/summary
  Future<TeknisiDashboardSummaryModel> getDashboardSummary(); // 👈 Method Baru
}