import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/configuration_item_model.dart';
import 'package:report/src/modules/teknisi_rfc/domain/usecase/create_change_request_rfc_usecase.dart';
import 'package:report/src/modules/teknisi_rfc/domain/usecase/create_incident_repeat_rfc_usecase.dart';
import 'package:report/src/modules/teknisi_rfc/domain/usecase/get_active_assets_usecase.dart';


part 'rfc_form_state.dart';

@injectable
class RfcFormCubit extends Cubit<RfcFormState> {
  final GetActiveAssetsUseCase _getActiveAssets;
  final CreateIncidentRepeatRfcUseCase _createIncidentRepeat;
  final CreateChangeRequestRfcUseCase _createChangeRequest;

  RfcFormCubit(
    this._getActiveAssets,
    this._createIncidentRepeat,
    this._createChangeRequest,
  ) : super(const RfcFormState());

  /// 🔹 Fetch Assets for Dropdown
  Future<void> fetchAssets() async {
    try {
      emit(state.copyWith(assetStatus: AssetStatus.loading));
      
      final result = await _getActiveAssets();
      
      emit(state.copyWith(
        assetStatus: AssetStatus.success,
        assets: result,
      ));
    } catch (e) {
      AppLogger.e("❌ Cubit: Error fetching assets", e);
      emit(state.copyWith(
        assetStatus: AssetStatus.failure,
        errorMessage: "Gagal memuat data aset. Silakan coba lagi.",
      ));
    }
  }

  /// 🔹 Submit Incident Repeat RFC
  Future<void> submitIncidentRepeat({
    required String judul,
    required int idAset,
    required String deskripsi,
    required String alasan,
    required String dampak,
    required String dampakJikaTidak,
    required int biaya,
  }) async {
    try {
      emit(state.copyWith(formStatus: FormSubmitStatus.submitting));

      await _createIncidentRepeat(
        judul: judul,
        idAset: idAset,
        deskripsi: deskripsi,
        alasan: alasan,
        dampak: dampak,
        dampakJikaTidak: dampakJikaTidak,
        biaya: biaya,
      );

      emit(state.copyWith(formStatus: FormSubmitStatus.success));
    } catch (e) {
      AppLogger.e("❌ Cubit: Error submit incident repeat", e);
      emit(state.copyWith(
        formStatus: FormSubmitStatus.failure,
        errorMessage: "Gagal mengajukan RFC. Periksa koneksi Anda.",
      ));
    }
  }

  /// 🔹 Submit Change Request RFC
  Future<void> submitChangeRequest({
    required String ticketId,
    required String judul,
    required int idAset,
    required String deskripsi,
    required String alasan,
    required String dampak,
    required String dampakJikaTidak,
    required int biaya,
  }) async {
    try {
      emit(state.copyWith(formStatus: FormSubmitStatus.submitting));

      await _createChangeRequest(
        ticketId: ticketId,
        judul: judul,
        idAset: idAset,
        deskripsi: deskripsi,
        alasan: alasan,
        dampak: dampak,
        dampakJikaTidak: dampakJikaTidak,
        biaya: biaya,
      );

      emit(state.copyWith(formStatus: FormSubmitStatus.success));
    } catch (e) {
      AppLogger.e("❌ Cubit: Error submit change request", e);
      emit(state.copyWith(
        formStatus: FormSubmitStatus.failure,
        errorMessage: "Gagal mengajukan RFC. Periksa koneksi Anda.",
      ));
    }
  }
}