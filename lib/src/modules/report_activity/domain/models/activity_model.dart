import 'package:equatable/equatable.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_rating_model.dart'; // ✅ Import Model Standar

class ActivityModel extends Equatable {
  final String id;                   // ticket_id
  final String ticketCode;           // ticket_code
  final String title;                // title
  final String description;          // description
  final String? priority;            // priority
  final String status;               // status
  final String createdAt;            // created_at
  
  final String? workStartDate;
  final String? workEndDate;
  final String? techWorkStartDate;
  final String? techWorkEndDate;

  final String userStatus;
  final String sectionStatus;
  final String? technicianStatus;

  // ✅ Gunakan TicketRatingModel agar konsisten dengan Detail & Mapper
  final TicketRatingModel? rating; 

  const ActivityModel({
    required this.id,
    required this.ticketCode,
    required this.title,
    required this.description,
    this.priority,
    required this.status,
    required this.createdAt,
    this.workStartDate,
    this.workEndDate,
    this.techWorkStartDate,
    this.techWorkEndDate,
    required this.userStatus,
    required this.sectionStatus,
    this.technicianStatus,
    this.rating,
  });

  // ---------------------------------------------------------------------------
  // Helper Logic (Domain Logic)
  // ---------------------------------------------------------------------------

  /// Helper untuk status lowercase agar aman
  String get _statusLower => status.toLowerCase();

  bool get isFinished => _statusLower == 'selesai';
  
  bool get isRejected => _statusLower.contains('tolak') || _statusLower == 'rejected';

  /// Apakah tombol rating harus muncul?
  /// Syarat: Status Selesai DAN Rating masih null (belum dirating)
  bool get showRateButton => isFinished && rating == null;

  /// Apakah tombol reopen harus muncul?
  /// Syarat: Status Selesai ATAU Ditolak
  bool get showReopenButton => isFinished || isRejected;

  /// Helper tanggal tampilan
  String get displayDate => workEndDate ?? createdAt;

  @override
  List<Object?> get props => [
        id,
        ticketCode,
        title,
        description,
        priority,
        status,
        createdAt,
        workStartDate,
        workEndDate,
        techWorkStartDate,
        techWorkEndDate,
        userStatus,
        sectionStatus,
        technicianStatus,
        rating, // ✅ Equatable akan mendeteksi perubahan jika rating terisi
      ];
}