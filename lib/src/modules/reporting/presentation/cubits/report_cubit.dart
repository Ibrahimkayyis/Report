import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';
import 'package:report/src/modules/reporting/domain/usecase/create_public_report_usecase.dart';
import 'report_state.dart';

@injectable
class ReportCubit extends Cubit<ReportState> {
  final CreatePublicReportUsecase _createPublicReportUsecase;

  ReportCubit(this._createPublicReportUsecase) : super(ReportInitial());

  Future<void> createPublicReport({
    required String opdId,
    required String categoryId,
    required String description,
    String? action,
    File? file,
  }) async {
    emit(ReportLoading());
    try {
      final ReportResponseModel result = await _createPublicReportUsecase(
        opdId: opdId,
        categoryId: categoryId,
        description: description,
        action: action,
        file: file,
      );
      emit(ReportSuccess(result));
    } catch (e) {
      emit(ReportError(e.toString()));
    }
  }
}
