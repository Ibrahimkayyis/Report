import 'dart:io';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart'; // Import Model Baru
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';

abstract class ReportActivityRemoteDataSource {
  Future<List<ActivityModel>> getFinishedActivities();
  
  Future<TrackTicketModel> trackTicket({required String ticketCode});

  Future<TicketDetailModel> getTicketDetail({
    required String ticketId,
    required UserType userType,
  });

  Future<void> reopenTicket({
    required String ticketId,
    required String reason,
    String? expectedSolution,
    List<File>? files,
  });

  /// [NEW] Submit Ticket Rating
  Future<RatingSubmissionModel> submitTicketRating({
    required String ticketId,
    required int rating,
    String? comment,
  });
}