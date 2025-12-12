import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/usecase/create_public_report_usecase.dart';
import 'masyarakat_report_state.dart';

@injectable
class MasyarakatReportCubit extends Cubit<MasyarakatReportState> {
  final CreatePublicReportUseCase _createPublicReportUseCase;

  MasyarakatReportCubit(this._createPublicReportUseCase)
      : super(MasyarakatReportInitial());

  Future<void> submitReport({
    required String title,
    required int idOpd,
    required String description,
    List<File>? files,
  }) async {
    emit(MasyarakatReportLoading());

    try {
      final result = await _createPublicReportUseCase(
        title: title,
        idOpd: idOpd,
        description: description,
        files: files,
      );

      emit(MasyarakatReportSuccess(result));
    } catch (e) {
      // Menghapus 'Exception: ' dari pesan error jika ada, agar lebih bersih di UI
      final message = e.toString().replaceAll('Exception: ', '');
      emit(MasyarakatReportError(message));
    }
  }
}