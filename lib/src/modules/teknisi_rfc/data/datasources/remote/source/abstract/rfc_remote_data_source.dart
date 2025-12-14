import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';

abstract class RfcRemoteDataSource {
  /// 🔹 Mengambil daftar RFC Incident Repeat
  Future<List<RfcModel>> getIncidentRepeatRfcs();

  /// 🔹 Mengambil daftar RFC Change Request
  Future<List<RfcModel>> getChangeRequestRfcs();

  /// ✅ 🔹 Mengambil DETAIL RFC Incident Repeat by ID
  Future<RfcModel> getIncidentRepeatDetail(String id);

  /// ✅ 🔹 Mengambil DETAIL RFC Change Request by ID
  Future<RfcModel> getChangeRequestDetail(String id);

  // =========================================================
  //  FORM METHODS (BARU)
  // =========================================================

  /// 🔹 Mengambil daftar Aset Aktif (Raw JSON)
  Future<List<dynamic>> getActiveAssets();

  /// 🔹 Submit Form RFC: Insiden Berulang
  Future<void> createIncidentRepeatRfc({
    required String judul,
    required int idAset,
    required String deskripsi,
    required String alasan,
    required String dampak,
    required String dampakJikaTidak,
    required int biaya,
  });

  /// 🔹 Submit Form RFC: Change Request (Dari Tiket)
  Future<void> createChangeRequestRfc({
    required String ticketId,
    required String judul,
    required int idAset,
    required String deskripsi,
    required String alasan,
    required String dampak,
    required String dampakJikaTidak,
    required int biaya,
  });
}