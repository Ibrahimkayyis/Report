import 'package:equatable/equatable.dart';

class TeknisiNotificationModel extends Equatable {
  final String id;
  final String? ticketId;
  final String message;
  final String? status;
  final bool isRead;
  final String createdAt;

  const TeknisiNotificationModel({
    required this.id,
    this.ticketId,
    required this.message,
    this.status,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        ticketId,
        message,
        status,
        isRead,
        createdAt,
      ];
}