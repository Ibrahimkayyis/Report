import 'package:equatable/equatable.dart';

class MasyarakatReportResponseModel extends Equatable {
  final String message;
  final String ticketId;
  final String ticketCode;
  final String title;
  final String description; // ✅ ADDED
  final String serviceType;
  final int opdId;
  final String opdName; // ✅ ADDED
  final String createdAt;
  final String? location;
  final String userStatus;
  final String status;
  final List<String> uploadedFiles;

  const MasyarakatReportResponseModel({
    required this.message,
    required this.ticketId,
    required this.ticketCode,
    required this.title,
    required this.description, // ✅ ADDED
    required this.serviceType,
    required this.opdId,
    required this.opdName, // ✅ ADDED
    required this.createdAt,
    this.location,
    required this.userStatus,
    required this.status,
    required this.uploadedFiles,
  });

  @override
  List<Object?> get props => [
        message,
        ticketId,
        ticketCode,
        title,
        description, // ✅ ADDED
        serviceType,
        opdId,
        opdName, // ✅ ADDED
        createdAt,
        location,
        userStatus,
        status,
        uploadedFiles,
      ];
}