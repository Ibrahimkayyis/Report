import 'package:injectable/injectable.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/opd_model.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/repositories/opd_repository.dart';

@injectable
class GetAllOpdUsecase {
  final OpdRepository repository;

  GetAllOpdUsecase(this.repository);

  Future<List<OpdModel>> call() {
    return repository.getAllOpd();
  }
}