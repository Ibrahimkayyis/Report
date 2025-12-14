import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';
import 'package:report/src/modules/teknisi_rfc/domain/usecase/get_change_request_rfc_usecase.dart';
import 'package:report/src/modules/teknisi_rfc/domain/usecase/get_incident_repeat_rfc_usecase.dart';

part 'rfc_state.dart';

@injectable
class RfcCubit extends Cubit<RfcState> {
  final GetIncidentRepeatRfcUseCase getIncidentRepeatRfcUseCase;
  final GetChangeRequestRfcUseCase getChangeRequestRfcUseCase;

  RfcCubit(
    this.getIncidentRepeatRfcUseCase,
    this.getChangeRequestRfcUseCase,
  ) : super(RfcInitial());

  /// 🔹 Mengambil semua data RFC yang sudah diserahkan (Submitted)
  /// Menggabungkan hasil dari Incident Repeat & Change Request
  Future<void> fetchSubmittedRfcs() async {
    emit(RfcLoading());

    try {
      // Panggil kedua API secara paralel menggunakan Future.wait
      final results = await Future.wait([
        getIncidentRepeatRfcUseCase(),
        getChangeRequestRfcUseCase(),
      ]);

      // Ambil hasil
      final incidentRfcs = results[0];
      final changeRequestRfcs = results[1];

      // Gabungkan list
      final List<RfcModel> allRfcs = [
        ...incidentRfcs,
        ...changeRequestRfcs,
      ];

      // Opsional: Urutkan berdasarkan tanggal terbaru (descending)
      // Asumsi format createdAt ISO8601 string
      allRfcs.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(RfcLoaded(submittedRfcs: allRfcs));
    } catch (e) {
      emit(RfcError(e.toString()));
    }
  }
}