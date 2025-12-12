import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/usecase/track_ticket_usecase.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/track_ticket/track_ticket_state.dart';

@injectable
class TrackTicketCubit extends Cubit<TrackTicketState> {
  final TrackTicketUseCase _trackTicketUseCase;

  TrackTicketCubit(this._trackTicketUseCase) : super(TrackTicketInitial());

  Future<void> trackTicket(String ticketCode) async {
    emit(TrackTicketLoading());

    try {
      final result = await _trackTicketUseCase(ticketCode);
      emit(TrackTicketLoaded(result));
    } catch (e) {
      // Menangkap error (misal: Tiket tidak ditemukan 404)
      // Pesan error bisa disesuaikan di Repository atau di sini
      emit(TrackTicketError(e.toString().replaceAll("Exception: ", "")));
    }
  }

  /// Reset state ke initial (jika user kembali ke halaman input)
  void reset() {
    emit(TrackTicketInitial());
  }
}