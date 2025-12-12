import 'dart:io';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';

abstract class ReportActivityRepository {
  /// Mengambil daftar aktivitas yang sudah selesai (List Utama)
  Future<List<ActivityModel>> getFinishedActivities();

  /// Melacak status tiket berdasarkan Kode Tiket (Tanpa Login/Public)
  Future<TrackTicketModel> trackTicket({required String ticketCode});

  /// [NEW] Mengambil detail lengkap tiket berdasarkan ID dan Role User
  /// Endpoint berbeda antara Masyarakat dan Pegawai
  Future<TicketDetailModel> getTicketDetail({
    required String ticketId,
    required UserType userType,
  });

  /// [NEW] Mengajukan pembukaan kembali tiket (Reopen)
  Future<void> reopenTicket({
    required String ticketId,
    required String reason,
    String? expectedSolution,
    List<File>? files,
  });

Future<RatingSubmissionModel> submitTicketRating({
    required String ticketId,
    required int rating,
    String? comment,
  });
}