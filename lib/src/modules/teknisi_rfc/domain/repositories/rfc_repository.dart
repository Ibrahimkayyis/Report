import '../models/configuration_item_model.dart'; // 👈 Import Model Aset
import '../models/rfc_model.dart';

abstract class RfcRepository {
  /// 🔹 Mengambil daftar RFC Incident Repeat
  Future<List<RfcModel>> getIncidentRepeatRfcs();

  /// 🔹 Mengambil daftar RFC Change Request
  Future<List<RfcModel>> getChangeRequestRfcs();

  /// ✅ Method Baru: Ambil Detail Incident Repeat
  Future<RfcModel> getIncidentRepeatDetail(String id);

  /// ✅ Method Baru: Ambil Detail Change Request
  Future<RfcModel> getChangeRequestDetail(String id);

  // =========================================================
  //  FORM METHODS (BARU)
  // =========================================================

  /// 🔹 Mengambil daftar Aset Aktif untuk Dropdown Form
  Future<List<ConfigurationItemModel>> getActiveAssets();

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