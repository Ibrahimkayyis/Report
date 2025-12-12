import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/usecase/reopen_ticket_usecase.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/reopen_ticket/reopen_ticket_state.dart';

@injectable
class ReopenTicketCubit extends Cubit<ReopenTicketState> {
  final ReopenTicketUseCase _reopenTicketUseCase;

  ReopenTicketCubit(this._reopenTicketUseCase) : super(ReopenTicketInitial());

  Future<void> submitReopen({
    required String ticketId,
    required String reason,
    String? expectedSolution,
    List<File>? files,
  }) async {
    emit(ReopenTicketLoading());

    try {
      await _reopenTicketUseCase(
        ticketId: ticketId,
        reason: reason,
        expectedSolution: expectedSolution,
        files: files,
      );

      emit(ReopenTicketSuccess());
    } catch (e) {
      emit(ReopenTicketError(e.toString()));
    }
  }
}