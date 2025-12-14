import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';
import 'package:report/src/modules/teknisi_rfc/domain/repositories/rfc_repository.dart';

@lazySingleton
class GetIncidentRepeatRfcUseCase {
  final RfcRepository repository;

  GetIncidentRepeatRfcUseCase(this.repository);

  /// Menjalankan use case untuk mengambil daftar RFC Incident Repeat
  Future<List<RfcModel>> call() async {
    return await repository.getIncidentRepeatRfcs();
  }
}