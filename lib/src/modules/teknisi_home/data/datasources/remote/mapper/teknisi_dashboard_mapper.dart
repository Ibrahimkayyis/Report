import '../../../../domain/models/teknisi_dashboard_summary_model.dart';

class TeknisiDashboardMapper {
  /// Mengubah JSON response dari API menjadi Domain Model
  static TeknisiDashboardSummaryModel mapToModel(Map<String, dynamic> json) {
    return TeknisiDashboardSummaryModel(
      teknisiId: json['teknisi_id'] as String? ?? '',
      opdId: json['opd_id'] as int? ?? 0,
      totalTickets: json['total_tickets'] as int? ?? 0,
      inProgress: json['in_progress'] as int? ?? 0,
      reopen: json['reopen'] as int? ?? 0,
      deadline: json['deadline'] as int? ?? 0,
    );
  }
}