import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';
import 'package:report/src/modules/teknisi_home/domain/usecase/get_teknisi_tickets_usecase.dart';
import 'teknisi_home_state.dart';

@injectable
class TeknisiHomeCubit extends Cubit<TeknisiHomeState> {
  final GetTeknisiTicketsUseCase _getTicketsUseCase;

  TeknisiHomeCubit(this._getTicketsUseCase) : super(const TeknisiHomeState());

  Future<void> fetchTickets() async {
    emit(state.copyWith(status: TeknisiHomeStatus.loading));

    try {
      final response = await _getTicketsUseCase();
      
      emit(state.copyWith(
        status: TeknisiHomeStatus.success,
        allTickets: response.data,
      ));
      
      _applyFilters(); 
    } catch (e) {
      emit(state.copyWith(
        status: TeknisiHomeStatus.failure,
        errorMessage: e.toString(),
      ));
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