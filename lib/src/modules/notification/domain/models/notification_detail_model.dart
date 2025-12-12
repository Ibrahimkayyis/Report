import 'package:equatable/equatable.dart';

class NotificationDetailModel extends Equatable {
  final String id; // notification_id
  final String ticketId;
  final String ticketCode;
  final String requestType;
  final String opdId;
  final String opdName; // nama_dinas
  final String? rejectionReason;
  final String statusTicket;
  final String message;
  final bool isRead;
  final String createdAt;

  const NotificationDetailModel({
    required this.id,
    required this.ticketId,
    required this.ticketCode,
    required this.requestType,
    required this.opdId,
    required this.opdName,
    this.rejectionReason,
    required this.statusTicket,
    required this.message,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        ticketId,
        ticketCode,
        requestType,
        opdId,
        opdName,
        rejectionReason,
        statusTicket,
        message,
        isRead,
        createdAt,
      ];
}