import 'package:equatable/equatable.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';

enum TeknisiTicketDetailStatus { initial, loading, success, failure, updating, updateSuccess }

class TeknisiTicketDetailState extends Equatable {
  final TeknisiTicketDetailStatus status;
  final TeknisiTicketDetailModel? ticket;
  final String? errorMessage;
  final String? successMessage;

  const TeknisiTicketDetailState({
    this.status = TeknisiTicketDetailStatus.initial,
    this.ticket,
    this.errorMessage,
    this.successMessage,
  });

  TeknisiTicketDetailState copyWith({
    TeknisiTicketDetailStatus? status,
    TeknisiTicketDetailModel? ticket,
    String? errorMessage,
    String? successMessage,
  }) {
    return TeknisiTicketDetailState(
      status: status ?? this.status,
      ticket: ticket ?? this.ticket,
      errorMessage: errorMessage, // Nullable untuk reset error
      successMessage: successMessage, // Nullable untuk reset success msg
    );
  }

  @override
  List<Object?> get props => [status, ticket, errorMessage, successMessage];
}