import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/repositories/report_activity_repository.dart';

@lazySingleton
class ReopenTicketUseCase {
  final ReportActivityRepository repository;

  ReopenTicketUseCase(this.repository);

  Future<void> call({
    required String ticketId,
    required String reason,
    String? expectedSolution,
    List<File>? files,
  }) {
    return repository.reopenTicket(
      ticketId: ticketId,
      reason: reason,
      expectedSolution: expectedSolution,
      files: files,
    );
  }
}