import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/usecase/get_finished_activities_usecase.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_state.dart';

@injectable
class ReportActivityCubit extends Cubit<ReportActivityState> {
  final GetFinishedActivitiesUseCase _getFinishedActivitiesUseCase;

  ReportActivityCubit(this._getFinishedActivitiesUseCase)
      : super(ReportActivityInitial());

  Future<void> getActivities() async {
    emit(ReportActivityLoading());

    try {
      final activities = await _getFinishedActivitiesUseCase();

      if (activities.isEmpty) {
        emit(ReportActivityEmpty());
      } else {
        emit(ReportActivityLoaded(activities));
      }
    } catch (e) {
      // Di real apps, kita bisa mapping error type di sini agar pesan lebih spesifik
      emit(ReportActivityError(e.toString()));
    }
  }
}