import 'package:injectable/injectable.dart';
import '../repositories/rfc_repository.dart';

@lazySingleton
class CreateIncidentRepeatRfcUseCase {
  final RfcRepository repository;

  CreateIncidentRepeatRfcUseCase(this.repository);

  Future<void> call({
    required String judul,
    required int idAset,
    required String deskripsi,
    required String alasan,
    required String dampak,
    required String dampakJikaTidak,
    required int biaya,
  }) {
    return repository.createIncidentRepeatRfc(
      judul: judul,
      idAset: idAset,
      deskripsi: deskripsi,
      alasan: alasan,
      dampak: dampak,
      dampakJikaTidak: dampakJikaTidak,
      biaya: biaya,
    );
  }
}