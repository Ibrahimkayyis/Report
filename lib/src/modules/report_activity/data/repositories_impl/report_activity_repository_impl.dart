import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import 'package:report/src/modules/report_activity/data/datasources/remote/source/abstract/report_activity_remote_data_source.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart'; // Import Model Baru
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';
import 'package:report/src/modules/report_activity/domain/repositories/report_activity_repository.dart';

@LazySingleton(as: ReportActivityRepository)
class ReportActivityRepositoryImpl implements ReportActivityRepository {
  final ReportActivityRemoteDataSource remoteDataSource;

  ReportActivityRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ActivityModel>> getFinishedActivities() async {
    try {
      return await remoteDataSource.getFinishedActivities();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TrackTicketModel> trackTicket({required String ticketCode}) async {
    try {
      return await remoteDataSource.trackTicket(ticketCode: ticketCode);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TicketDetailModel> getTicketDetail({
    required String ticketId,
    required UserType userType,
  }) async {
    try {
      return await remoteDataSource.getTicketDetail(
        ticketId: ticketId,
        userType: userType,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> reopenTicket({
    required String ticketId,
    required String reason,
    String? expectedSolution,
    List<File>? files,
  }) async {
    try {
      await remoteDataSource.reopenTicket(
        ticketId: ticketId,
        reason: reason,
        expectedSolution: expectedSolution,
        files: files,
      );
    } catch (e) {
      rethrow;
    }
  }

  // --- NEW IMPLEMENTATION: SUBMIT RATING ---
  @override
  Future<RatingSubmissionModel> submitTicketRating({
    required String ticketId,
    required int rating,
    String? comment,
  }) async {
    try {
      return await remoteDataSource.submitTicketRating(
        ticketId: ticketId,
        rating: rating,
        comment: comment,
      );
    } catch (e) {
      rethrow;
    }
  }
}