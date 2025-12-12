import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/usecase/complete_ticket_usecase.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/usecase/get_ticket_detail_usecase.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/usecase/start_ticket_process_usecase.dart';
import 'teknisi_ticket_detail_state.dart';

@injectable
class TeknisiTicketDetailCubit extends Cubit<TeknisiTicketDetailState> {
  final GetTicketDetailUseCase _getDetailUseCase;
  final StartTicketProcessUseCase _startProcessUseCase;
  final CompleteTicketUseCase _completeTicketUseCase;

  TeknisiTicketDetailCubit(
    this._getDetailUseCase,
    this._startProcessUseCase,
    this._completeTicketUseCase,
  ) : super(const TeknisiTicketDetailState());

  /// 1. Load Data Awal
  Future<void> fetchDetail(String ticketId) async {
    emit(state.copyWith(status: TeknisiTicketDetailStatus.loading));

    try {
      final ticket = await _getDetailUseCase(ticketId);
      emit(state.copyWith(
        status: TeknisiTicketDetailStatus.success,
        ticket: ticket,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: TeknisiTicketDetailStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  /// 2. Update Status (Smart Logic)
  Future<void> updateStatus(String targetStatus) async {
    final currentTicket = state.ticket;
    if (currentTicket == null) return;

    emit(state.copyWith(status: TeknisiTicketDetailStatus.updating));

    try {
      final status = targetStatus.toLowerCase();

      if (status == 'diproses') {
        await _startProcessUseCase(currentTicket.id);
      } else if (status == 'selesai') {
        await _completeTicketUseCase(currentTicket.id);
      } else {
        throw Exception("Status tidak valid untuk diupdate: $targetStatus");
      }

      // ✅ FIX: Emit success tanpa fetch ulang detail
      // Fetch ulang berpotensi error 403 jika status berubah dan user kehilangan akses view
      emit(state.copyWith(
        status: TeknisiTicketDetailStatus.updateSuccess,
        successMessage: "Status tiket berhasil diperbarui menjadi $targetStatus",
      ));
      
      // Kita tidak memanggil fetchDetail(currentTicket.id) di sini.

    } catch (e) {
      emit(state.copyWith(
        status: TeknisiTicketDetailStatus.failure,
        errorMessage: e.toString(),
      ));
      
      // Kembalikan ke success dengan data lama agar UI tidak stuck
      emit(state.copyWith(
        status: TeknisiTicketDetailStatus.success, 
        ticket: currentTicket
      ));
    }
  }
}