import 'package:report/src/modules/teknisi_home/domain/models/teknisi_dashboard_summary_model.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';

abstract class TeknisiHomeRemoteDataSource {
  Future<TeknisiTicketResponse> getTeknisiTickets();
  
  /// 🔹 Mengambil ringkasan statistik kinerja teknisi
  Future<TeknisiDashboardSummaryModel> getDashboardSummary(); // 👈 Method Baru
}