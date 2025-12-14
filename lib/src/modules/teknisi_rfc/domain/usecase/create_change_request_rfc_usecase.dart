import 'package:injectable/injectable.dart';
import '../repositories/rfc_repository.dart';

@lazySingleton
class CreateChangeRequestRfcUseCase {
  final RfcRepository repository;

  CreateChangeRequestRfcUseCase(this.repository);

  Future<void> call({
    required String ticketId,
    required String judul,
    required int idAset,
    required String deskripsi,
    required String alasan,
    required String dampak,
    required String dampakJikaTidak,
    required int biaya,
  }) {
    return repository.createChangeRequestRfc(
      ticketId: ticketId,
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