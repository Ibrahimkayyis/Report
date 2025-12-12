import 'package:equatable/equatable.dart';
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';

abstract class TrackTicketState extends Equatable {
  const TrackTicketState();

  @override
  List<Object?> get props => [];
}

class TrackTicketInitial extends TrackTicketState {}

class TrackTicketLoading extends TrackTicketState {}

class TrackTicketLoaded extends TrackTicketState {
  final TrackTicketModel data;

  const TrackTicketLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class TrackTicketError extends TrackTicketState {
  final String message;

  const TrackTicketError(this.message);

  @override
  List<Object?> get props => [message];
}