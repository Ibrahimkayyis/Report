import 'package:equatable/equatable.dart';

abstract class ReopenTicketState extends Equatable {
  const ReopenTicketState();

  @override
  List<Object?> get props => [];
}

class ReopenTicketInitial extends ReopenTicketState {}

class ReopenTicketLoading extends ReopenTicketState {}

class ReopenTicketSuccess extends ReopenTicketState {}

class ReopenTicketError extends ReopenTicketState {
  final String message;

  const ReopenTicketError(this.message);

  @override
  List<Object?> get props => [message];
}