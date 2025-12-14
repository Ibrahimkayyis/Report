import 'package:injectable/injectable.dart';
import '../../domain/models/configuration_item_model.dart'; // 👈 Import Model Aset
import '../datasources/remote/mapper/configuration_item_mapper.dart'; // 👈 Import Mapper Aset
import '../datasources/remote/source/abstract/rfc_remote_data_source.dart';
import '../../domain/models/rfc_model.dart';
import '../../domain/repositories/rfc_repository.dart';

@LazySingleton(as: RfcRepository)
class RfcRepositoryImpl implements RfcRepository {
  final RfcRemoteDataSource remoteDataSource;

  RfcRepositoryImpl(this.remoteDataSource);

  // --- LIST METHODS ---

  @override
  Future<List<RfcModel>> getIncidentRepeatRfcs() async {
    try {
      return await remoteDataSource.getIncidentRepeatRfcs();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RfcModel>> getChangeRequestRfcs() async {
    try {
      return await remoteDataSource.getChangeRequestRfcs();
    } catch (e) {
      rethrow;
    }
  }

  // --- DETAIL METHODS ---

  @override
  Future<RfcModel> getIncidentRepeatDetail(String id) async {
    try {
      return await remoteDataSource.getIncidentRepeatDetail(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RfcModel> getChangeRequestDetail(String id) async {
    try {
      return await remoteDataSource.getChangeRequestDetail(id);
    } catch (e) {
      rethrow;
    }
  }

  // =========================================================
  //  FORM METHODS (BARU)
  // =========================================================

  @override
  Future<List<ConfigurationItemModel>> getActiveAssets() async {
    try {
      // 1. Ambil Raw Data (List) dari Remote Source
      final response = await remoteDataSource.getActiveAssets();
      
      // 2. Konversi menggunakan Mapper
      // Karena Mapper (Langkah 4) menerima Map dengan key 'items', 
      // dan Remote Source (Langkah 5) mengembalikan List, kita bungkus listnya.
      return ConfigurationItemMapper.mapToListResponse({'items': response});
    } catch (e) {
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
      await remoteDataSource.createIncidentRepeatRfc(
        judul: judul,
        idAset: idAset,
        deskripsi: deskripsi,
        alasan: alasan,
        dampak: dampak,
        dampakJikaTidak: dampakJikaTidak,
        biaya: biaya,
      );
    } catch (e) {
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
      await remoteDataSource.createChangeRequestRfc(
        ticketId: ticketId,
        judul: judul,
        idAset: idAset,
        deskripsi: deskripsi,
        alasan: alasan,
        dampak: dampak,
        dampakJikaTidak: dampakJikaTidak,
        biaya: biaya,
      );
    } catch (e) {
      rethrow;
    }
  }
}