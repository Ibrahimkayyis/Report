import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_home/data/datasources/remote/source/abstract/teknisi_home_remote_data_source.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';
import 'package:report/src/modules/teknisi_home/domain/repositories/teknisi_home_repository.dart';

@LazySingleton(as: TeknisiHomeRepository)
class TeknisiHomeRepositoryImpl implements TeknisiHomeRepository {
  final TeknisiHomeRemoteDataSource remoteDataSource;

  TeknisiHomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<TeknisiTicketResponse> getTeknisiTickets() async {
    try {
      return await remoteDataSource.getTeknisiTickets();
    } catch (e) {
      rethrow;
    }
  }
}