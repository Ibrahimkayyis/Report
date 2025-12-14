import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';
import 'package:report/src/modules/teknisi_rfc/domain/usecase/get_change_request_detail_usecase.dart';
import 'package:report/src/modules/teknisi_rfc/domain/usecase/get_incident_repeat_detail_usecase.dart';

part 'rfc_detail_state.dart';

@injectable
class RfcDetailCubit extends Cubit<RfcDetailState> {
  final GetIncidentRepeatDetailUseCase getIncidentRepeatDetailUseCase;
  final GetChangeRequestDetailUseCase getChangeRequestDetailUseCase;

  RfcDetailCubit(
    this.getIncidentRepeatDetailUseCase,
    this.getChangeRequestDetailUseCase,
  ) : super(RfcDetailInitial());

  Future<void> fetchDetail(String id, RfcType type) async {
    emit(RfcDetailLoading());

    try {
      RfcModel? result;

      // 🔹 Tentukan use case mana yang dipanggil berdasarkan tipe RFC
      if (type == RfcType.incidentRepeat) {
        result = await getIncidentRepeatDetailUseCase(id);
      } else if (type == RfcType.changeRequest) {
        result = await getChangeRequestDetailUseCase(id);
      }

      if (result != null) {
        emit(RfcDetailLoaded(result));
      } else {
        emit(const RfcDetailError("Gagal mengambil data detail"));
      }
    } catch (e) {
      emit(RfcDetailError(e.toString()));
    }
  }
}