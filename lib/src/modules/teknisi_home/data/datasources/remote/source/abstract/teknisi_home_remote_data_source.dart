import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';

abstract class TeknisiHomeRemoteDataSource {
  Future<TeknisiTicketResponse> getTeknisiTickets();
}