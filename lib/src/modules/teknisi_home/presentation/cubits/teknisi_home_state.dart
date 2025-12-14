import 'package:equatable/equatable.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';
// ✅ Import Model Baru
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_dashboard_summary_model.dart';

enum TeknisiHomeStatus { initial, loading, success, failure }

class TeknisiHomeState extends Equatable {
  final TeknisiHomeStatus status;
  final List<TeknisiTicketModel> allTickets;
  final List<TeknisiTicketModel> filteredTickets;
  final String? errorMessage;

  // ✅ Field Baru: Dashboard Summary
  final TeknisiDashboardSummaryModel? dashboardSummary;

  // --- State Filter ---
  final int selectedTabIndex;
  final String? filterPriority;
  final String? filterStatusTeknisi;
  final String? filterSubKategori;

  const TeknisiHomeState({
    this.status = TeknisiHomeStatus.initial,
    this.allTickets = const [],
    this.filteredTickets = const [],
    this.errorMessage,
    this.dashboardSummary, // Initialize
    this.selectedTabIndex = 0,
    this.filterPriority,
    this.filterStatusTeknisi,
    this.filterSubKategori,
  });

  TeknisiHomeState copyWith({
    TeknisiHomeStatus? status,
    List<TeknisiTicketModel>? allTickets,
    List<TeknisiTicketModel>? filteredTickets,
    String? errorMessage,
    TeknisiDashboardSummaryModel? dashboardSummary, // Parameter
    int? selectedTabIndex,
    String? filterPriority,
    String? filterStatusTeknisi,
    String? filterSubKategori,
  }) {
    return TeknisiHomeState(
      status: status ?? this.status,
      allTickets: allTickets ?? this.allTickets,
      filteredTickets: filteredTickets ?? this.filteredTickets,
      errorMessage: errorMessage,
      dashboardSummary: dashboardSummary ?? this.dashboardSummary, // Assignment
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      filterPriority: filterPriority ?? this.filterPriority,
      filterStatusTeknisi: filterStatusTeknisi ?? this.filterStatusTeknisi,
      filterSubKategori: filterSubKategori ?? this.filterSubKategori,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allTickets,
        filteredTickets,
        errorMessage,
        dashboardSummary, // Add to props
        selectedTabIndex,
        filterPriority,
        filterStatusTeknisi,
        filterSubKategori,
      ];
}