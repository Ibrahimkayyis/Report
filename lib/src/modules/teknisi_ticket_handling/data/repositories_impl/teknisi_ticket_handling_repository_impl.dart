import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_ticket_handling/data/datasources/remote/source/abstract/teknisi_ticket_handling_remote_data_source.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/repositories/teknisi_ticket_handling_repository.dart';

@LazySingleton(as: TeknisiTicketHandlingRepository)
class TeknisiTicketHandlingRepositoryImpl
    implements TeknisiTicketHandlingRepository {
  final TeknisiTicketHandlingRemoteDataSource remoteDataSource;

  TeknisiTicketHandlingRepositoryImpl(this.remoteDataSource);

  @override
  Future<TeknisiTicketDetailModel> getTicketDetail(String ticketId) async {
    try {
      return await remoteDataSource.getTicketDetail(ticketId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> startTicketProcess(String ticketId) async {
    try {
      await remoteDataSource.startTicketProcess(ticketId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> completeTicket(String ticketId) async {
    try {
      await remoteDataSource.completeTicket(ticketId);
    } catch (e) {
      rethrow;
    }
  }
}