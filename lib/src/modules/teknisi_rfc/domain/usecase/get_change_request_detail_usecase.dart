import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';
import 'package:report/src/modules/teknisi_rfc/domain/repositories/rfc_repository.dart';

@lazySingleton
class GetChangeRequestDetailUseCase {
  final RfcRepository repository;

  GetChangeRequestDetailUseCase(this.repository);

  Future<RfcModel> call(String id) async {
    return await repository.getChangeRequestDetail(id);
  }
}