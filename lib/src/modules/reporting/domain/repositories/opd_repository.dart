import 'package:report/src/modules/reporting/domain/models/opd_model.dart';

abstract class OpdRepository {
  Future<List<OpdModel>> getAllOpd();
}
