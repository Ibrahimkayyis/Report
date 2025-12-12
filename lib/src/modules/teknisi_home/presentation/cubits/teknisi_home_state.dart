import 'package:equatable/equatable.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';

enum TeknisiHomeStatus { initial, loading, success, failure }

class TeknisiHomeState extends Equatable {
  final TeknisiHomeStatus status;
  final List<TeknisiTicketModel> allTickets;
  final List<TeknisiTicketModel> filteredTickets;
  final String? errorMessage;

  // --- State Filter ---
  final int selectedTabIndex;
  final String? filterPriority; 
  final String? filterStatusTeknisi; // ✅ Ganti filterStatus -> filterStatusTeknisi
  final String? filterSubKategori;   // ✅ Ganti filterKategori -> filterSubKategori

  const TeknisiHomeState({
    this.status = TeknisiHomeStatus.initial,
    this.allTickets = const [],
    this.filteredTickets = const [],
    this.errorMessage,
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
        selectedTabIndex,
        filterPriority,
        filterStatusTeknisi,
        filterSubKategori,
      ];
}