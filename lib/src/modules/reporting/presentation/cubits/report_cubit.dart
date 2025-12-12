import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/usecase/create_public_report_usecase.dart';
import 'report_state.dart';

@injectable
class ReportCubit extends Cubit<ReportState> {
  final CreatePublicReportUseCase _createPublicReportUseCase;

  ReportCubit(this._createPublicReportUseCase) : super(ReportInitial());

  Future<void> submitReport({
    required int assetId,
    required String title,
    required String description,
    required String location,
    required String expectedResolution,
    required List<File> files,
  }) async {
    emit(ReportLoading());

    try {
      final result = await _createPublicReportUseCase(
        assetId: assetId,
        title: title,
        description: description,
        location: location,
        expectedResolution: expectedResolution,
        files: files,
      );

      emit(ReportSuccess(result));
    } catch (e) {
      emit(ReportError(e.toString()));
    }
  }
}