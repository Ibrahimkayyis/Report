import 'package:equatable/equatable.dart';

class ReportResponseModel extends Equatable {
  final String message;
  final String ticketId;
  final String status;
  final String ticketStage;
  final String? fileUrl;

  const ReportResponseModel({
    required this.message,
    required this.ticketId,
    required this.status,
    required this.ticketStage,
    this.fileUrl,
  });

  ReportResponseModel copyWith({
    String? message,
    String? ticketId,
    String? status,
    String? ticketStage,
    String? fileUrl,
  }) {
    return ReportResponseModel(
      message: message ?? this.message,
      ticketId: ticketId ?? this.ticketId,
      status: status ?? this.status,
      ticketStage: ticketStage ?? this.ticketStage,
      fileUrl: fileUrl ?? this.fileUrl,
    );
  }

  @override
  List<Object?> get props => [message, ticketId, status, ticketStage, fileUrl];

  @override
  String toString() =>
      'ReportResponseModel(ticketId: $ticketId, status: $status, message: $message)';
}
