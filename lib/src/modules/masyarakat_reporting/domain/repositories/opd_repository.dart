import 'package:report/src/modules/masyarakat_reporting/domain/models/opd_model.dart';

abstract class OpdRepository {
  Future<List<OpdModel>> getAllOpd();
}
