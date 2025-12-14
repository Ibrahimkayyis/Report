import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/teknisi_rfc/data/datasources/remote/mapper/rfc_mapper.dart';
import 'package:report/src/modules/teknisi_rfc/data/datasources/remote/source/abstract/rfc_remote_data_source.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';

@LazySingleton(as: RfcRemoteDataSource)
class RfcRemoteDataSourceImpl implements RfcRemoteDataSource {
  final Dio dio;

  RfcRemoteDataSourceImpl(this.dio);

  // --- LIST METHODS ---

  @override
  Future<List<RfcModel>> getIncidentRepeatRfcs() async {
    try {
      AppLogger.i("📡 Fetching Incident Repeat RFCs...");
      final response = await dio.get('/api/rfc/incident-repeat');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        AppLogger.d("✅ Incident Repeat RFCs fetched: ${data.length} items");
        return data
            .map(
              (json) => RfcMapper.fromJson(
                json as Map<String, dynamic>,
                type: RfcType.incidentRepeat,
              ),
            )
            .toList();
      } else {
        throw Exception(
          'Failed to load Incident Repeat RFCs: ${response.statusCode}',
        );
      }
    } catch (e) {
      AppLogger.e("❌ Error fetching Incident Repeat RFCs", e);
      rethrow;
    }
  }

  @override
  Future<List<RfcModel>> getChangeRequestRfcs() async {
    try {
      AppLogger.i("📡 Fetching Change Request RFCs...");
      final response = await dio.get('/api/rfc/change-request');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        AppLogger.d("✅ Change Request RFCs fetched: ${data.length} items");
        return data
            .map(
              (json) => RfcMapper.fromJson(
                json as Map<String, dynamic>,
                type: RfcType.changeRequest,
              ),
            )
            .toList();
      } else {
        throw Exception(
          'Failed to load Change Request RFCs: ${response.statusCode}',
        );
      }
    } catch (e) {
      AppLogger.e("❌ Error fetching Change Request RFCs", e);
      rethrow;
    }
  }

  // --- DETAIL METHODS ---

  @override
  Future<RfcModel> getIncidentRepeatDetail(String id) async {
    try {
      AppLogger.i("📡 Fetching Incident Repeat Detail (ID: $id)...");
      final response = await dio.get('/api/rfc/incident-repeat/$id');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        AppLogger.d("✅ Incident Repeat Detail fetched successfully");
        return RfcMapper.fromJson(data, type: RfcType.incidentRepeat);
      } else {
        throw Exception('Failed to load detail: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.e("❌ Error fetching detail", e);
      rethrow;
    }
  }

  @override
  Future<RfcModel> getChangeRequestDetail(String id) async {
    try {
      AppLogger.i("📡 Fetching Change Request Detail (ID: $id)...");
      final response = await dio.get('/api/rfc/change-request/$id');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        AppLogger.d("✅ Change Request Detail fetched successfully");
        return RfcMapper.fromJson(data, type: RfcType.changeRequest);
      } else {
        throw Exception('Failed to load detail: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.e("❌ Error fetching detail", e);
      rethrow;
    }
  }

  // =========================================================
  //  FORM METHODS (BARU)
  // =========================================================

  @override
  Future<List<dynamic>> getActiveAssets() async {
    try {
      AppLogger.i("📡 Fetching Active Assets...");

      final response = await dio.get('/api/configuration-items/active');

      if (response.statusCode == 200) {
        // 🔴 KODE LAMA (ERROR):
        // return response.data as List<dynamic>;

        // 🟢 PERBAIKAN:
        // Ambil data sebagai Map dulu, baru ambil value dari key 'items'
        final Map<String, dynamic> jsonData = response.data;

        // Pastikan key 'items' ada dan berupa List
        if (jsonData.containsKey('items') && jsonData['items'] is List) {
          return jsonData['items'] as List<dynamic>;
        }

        return []; // Return list kosong jika tidak ada key 'items'
      } else {
        throw Exception('Failed to load assets: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.e("❌ Error fetching assets", e);
      rethrow;
    }
  }

  @override
  Future<void> createIncidentRepeatRfc({
    required String judul,
    required int idAset,
    required String deskripsi,
    required String alasan,
    required String dampak,
    required String dampakJikaTidak,
    required int biaya,
  }) async {
    try {
      AppLogger.i("📤 Submitting Incident Repeat RFC...");

      final data = {
        "judul_perubahan": judul,
        "id_aset": idAset,
        "deskripsi_aset": deskripsi,
        "alasan_perubahan": alasan,
        "dampak_perubahan": dampak,
        "dampak_jika_tidak": dampakJikaTidak,
        "biaya_estimasi": biaya,
      };

      final response = await dio.post('/api/rfc/incident-repeat', data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.d("✅ Incident Repeat RFC Submitted Successfully");
      } else {
        throw Exception('Failed to submit RFC: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.e("❌ Error submitting Incident Repeat RFC", e);
      rethrow;
    }
  }

  @override
  Future<void> createChangeRequestRfc({
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
      AppLogger.i("📤 Submitting Change Request RFC (Ticket: $ticketId)...");

      final data = {
        "ticket_id": ticketId,
        "judul_perubahan": judul,
        "id_aset": idAset,
        "deskripsi_aset": deskripsi,
        "alasan_perubahan": alasan,
        "dampak_perubahan": dampak,
        "dampak_jika_tidak": dampakJikaTidak,
        "biaya_estimasi": biaya,
      };

      final response = await dio.post('/api/rfc/change-request', data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.d("✅ Change Request RFC Submitted Successfully");
      } else {
        throw Exception('Failed to submit RFC: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.e("❌ Error submitting Change Request RFC", e);
      rethrow;
    }
  }
}
