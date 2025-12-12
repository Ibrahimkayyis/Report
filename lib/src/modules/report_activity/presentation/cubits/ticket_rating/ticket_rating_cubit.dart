import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/usecase/submit_ticket_rating_usecase.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_rating/ticket_rating_state.dart';

@injectable
class TicketRatingCubit extends Cubit<TicketRatingState> {
  final SubmitTicketRatingUseCase _submitTicketRatingUseCase;

  TicketRatingCubit(this._submitTicketRatingUseCase)
      : super(TicketRatingInitial());

  Future<void> submitRating({
    required String ticketId,
    required int rating,
    String? comment,
  }) async {
    emit(TicketRatingLoading());

    try {
      final result = await _submitTicketRatingUseCase(
        ticketId: ticketId,
        rating: rating,
        comment: comment,
      );

      emit(TicketRatingSuccess(result));
    } catch (e) {
      emit(TicketRatingError(e.toString()));
    }
  }
}