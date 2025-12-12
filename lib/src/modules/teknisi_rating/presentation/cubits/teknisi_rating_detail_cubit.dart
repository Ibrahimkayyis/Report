import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rating/domain/usecase/get_teknisi_rating_detail_usecase.dart';
import 'teknisi_rating_detail_state.dart';

@injectable
class TeknisiRatingDetailCubit extends Cubit<TeknisiRatingDetailState> {
  final GetTeknisiRatingDetailUseCase _getDetailUseCase;

  TeknisiRatingDetailCubit(this._getDetailUseCase)
      : super(const TeknisiRatingDetailState());

  Future<void> fetchRatingDetail(String ticketId) async {
    emit(state.copyWith(status: TeknisiRatingDetailStatus.loading));

    try {
      final result = await _getDetailUseCase(ticketId);
      
      emit(state.copyWith(
        status: TeknisiRatingDetailStatus.success,
        rating: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: TeknisiRatingDetailStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}