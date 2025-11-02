import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/ticket_category_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/ticket_category_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/ticket_category_repository.dart';

@LazySingleton(as: TicketCategoryRepository)
class TicketCategoryRepositoryImpl implements TicketCategoryRepository {
  final TicketCategoryRemoteDataSource _remoteDataSource;

  TicketCategoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<TicketCategoryModel>> getTicketCategories() async {
    return await _remoteDataSource.getTicketCategories();
  }
}
