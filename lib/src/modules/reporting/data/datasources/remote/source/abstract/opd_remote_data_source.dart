import 'package:report/src/modules/reporting/domain/models/opd_model.dart';

abstract class OpdRemoteDataSource {
  Future<List<OpdModel>> getAllOpd();
}
