import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';
import 'package:report/src/modules/teknisi_home/domain/usecase/get_teknisi_tickets_usecase.dart';
import '../../domain/usecase/get_teknisi_dashboard_summary_usecase.dart'; // 👈 Import UseCase Baru
import 'teknisi_home_state.dart';

@injectable
class TeknisiHomeCubit extends Cubit<TeknisiHomeState> {
  final GetTeknisiTicketsUseCase _getTicketsUseCase;
  final GetTeknisiDashboardSummaryUseCase _getSummaryUseCase; // 👈 Inject

  TeknisiHomeCubit(
    this._getTicketsUseCase,
    this._getSummaryUseCase,
  ) : super(const TeknisiHomeState());

  /// 🔹 Main Fetch Method (Tickets + Summary)
  Future<void> fetchTickets() async {
    emit(state.copyWith(status: TeknisiHomeStatus.loading));

    try {
      // Kita jalankan request secara parallel agar lebih cepat
      // Future.wait menunggu kedua request selesai
      final results = await Future.wait([
        _getTicketsUseCase(),
        _getSummaryUseCase(),
      ]);

      // Ambil hasil request
      final ticketResponse = results[0] as TeknisiTicketResponse;
      final summaryResponse = results[1] as dynamic; // Cast dinamis (Model Summary)

      emit(state.copyWith(
        status: TeknisiHomeStatus.success,
        allTickets: ticketResponse.data,
        dashboardSummary: summaryResponse, // ✅ Update State Summary
      ));

      _applyFilters();
    } catch (e) {
      AppLogger.e("Error fetching teknisi home data", e);
      emit(state.copyWith(
        status: TeknisiHomeStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  /// 🔹 Fetch Summary Only (Optional use independently)
  Future<void> fetchDashboardSummary() async {
    try {
      final summary = await _getSummaryUseCase();
      emit(state.copyWith(dashboardSummary: summary));
    } catch (e) {
      // Jika fetch summary gagal sendiri, log saja, jangan ubah status UI utama jadi failure
      AppLogger.e("Failed to refresh summary", e);
    }
  }

  void updateFilter({
    int? tabIndex,
    String? priority,
    String? statusTeknisi,
    String? subKategori,
  }) {
    emit(state.copyWith(
      selectedTabIndex: tabIndex,
      filterPriority: priority,
      filterStatusTeknisi: statusTeknisi,
      filterSubKategori: subKategori,
    ));

    _applyFilters();
  }

  void _applyFilters() {
    List<TeknisiTicketModel> temp = List.from(state.allTickets);

    // A. Filter Tab (Berdasarkan REQUEST TYPE)
    if (state.selectedTabIndex == 0) {
      // Tab 0: "Pelaporan" (pelaporan_online)
      temp = temp.where((t) => t.requestType == 'pelaporan_online').toList();
    } else {
      // Tab 1: "Pelayanan" (pengajuan_pelayanan)
      temp = temp.where((t) => t.requestType == 'pengajuan_pelayanan').toList();
    }

    // B. Filter Priority
    if (state.filterPriority != null && state.filterPriority != 'Semua') {
      temp = temp.where((t) => t.priority.toLowerCase() == state.filterPriority!.toLowerCase()).toList();
    }

    // C. Filter Status Teknisi
    if (state.filterStatusTeknisi != null && state.filterStatusTeknisi != 'Semua') {
      temp = temp.where((t) => t.statusTeknisi.toLowerCase() == state.filterStatusTeknisi!.toLowerCase()).toList();
    }

    // D. Filter Sub Kategori
    if (state.filterSubKategori != null && state.filterSubKategori != 'Semua') {
      temp = temp.where((t) {
        final subKat = t.asset?.subkategoriNama ?? '-';
        return subKat.toLowerCase() == state.filterSubKategori!.toLowerCase();
      }).toList();
    }

    emit(state.copyWith(filteredTickets: temp));
  }
}