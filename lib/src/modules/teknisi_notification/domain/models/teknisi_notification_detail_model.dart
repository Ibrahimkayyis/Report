import 'package:equatable/equatable.dart';

class TeknisiNotificationDetailModel extends Equatable {
  final String id;
  final String? ticketId;
  final String? ticketCode; // Field tambahan khusus detail
  final String message;
  final String? status;
  final bool isRead;
  final String createdAt;

  const TeknisiNotificationDetailModel({
    required this.id,
    this.ticketId,
    this.ticketCode,
    required this.message,
    this.status,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        ticketId,
        ticketCode,
        message,
        status,
        isRead,
        createdAt,
      ];
}