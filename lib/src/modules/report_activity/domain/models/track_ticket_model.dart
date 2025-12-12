import 'package:equatable/equatable.dart';

class TrackTicketModel extends Equatable {
  final String ticketCode;
  final String userStatus;
  final String requestType;
  final int opdId;
  final String opdName;

  const TrackTicketModel({
    required this.ticketCode,
    required this.userStatus,
    required this.requestType,
    required this.opdId,
    required this.opdName,
  });

  @override
  List<Object?> get props => [
        ticketCode,
        userStatus,
        requestType,
        opdId,
        opdName,
      ];
}