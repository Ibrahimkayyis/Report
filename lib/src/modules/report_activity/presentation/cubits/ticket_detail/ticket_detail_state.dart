import 'package:equatable/equatable.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';

abstract class TicketDetailState extends Equatable {
  const TicketDetailState();

  @override
  List<Object?> get props => [];
}

class TicketDetailInitial extends TicketDetailState {}

class TicketDetailLoading extends TicketDetailState {}

class TicketDetailLoaded extends TicketDetailState {
  final TicketDetailModel ticket;

  const TicketDetailLoaded(this.ticket);

  @override
  List<Object?> get props => [ticket];
}

class TicketDetailError extends TicketDetailState {
  final String message;

  const TicketDetailError(this.message);

  @override
  List<Object?> get props => [message];
}