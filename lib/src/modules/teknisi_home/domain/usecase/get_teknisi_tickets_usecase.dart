import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';
import 'package:report/src/modules/teknisi_home/domain/repositories/teknisi_home_repository.dart';

@lazySingleton
class GetTeknisiTicketsUseCase {
  final TeknisiHomeRepository repository;

  GetTeknisiTicketsUseCase(this.repository);

  Future<TeknisiTicketResponse> call() {
    return repository.getTeknisiTickets();
  }
}