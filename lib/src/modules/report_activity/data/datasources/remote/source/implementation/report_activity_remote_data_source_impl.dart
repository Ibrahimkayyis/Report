import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import 'package:report/src/modules/report_activity/data/datasources/remote/mapper/activity_mapper.dart';
import 'package:report/src/modules/report_activity/data/datasources/remote/source/abstract/report_activity_remote_data_source.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart'; // Import
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';

@LazySingleton(as: ReportActivityRemoteDataSource)
class ReportActivityRemoteDataSourceImpl implements ReportActivityRemoteDataSource {
  final Dio dio;

  ReportActivityRemoteDataSourceImpl(this.dio);

  // ... (Method getFinishedActivities, trackTicket, getTicketDetail, reopenTicket tetap sama) ...

  @override
  Future<List<ActivityModel>> getFinishedActivities() async {
    // ... implementation ...
    try {
      final authLocal = sl<AuthLocalDataSource>();
      final role = await authLocal.getRole();

      String endpoint = '/api/tickets/masyarakat/finished'; 

      if (role != null) {
        final r = role.toLowerCase();
        if (r != 'masyarakat') {
          endpoint = '/api/tickets/pegawai/finished';
        }
      }

      AppLogger.i("📡 Fetching Activities ($role) -> Endpoint: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final dataList = response.data['data'] as List;
        
        return dataList
            .map((json) => ActivityMapper.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      
      throw Exception('Failed to load activities: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch finished activities", e);
      rethrow;
    }
  }

  @override
  Future<TrackTicketModel> trackTicket({required String ticketCode}) async {
    // ... implementation ...
    try {
      final endpoint = '/api/track-ticket/$ticketCode';
      AppLogger.i("🔍 Tracking Ticket: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        return ActivityMapper.fromTrackTicketJson(response.data);
      }

      throw Exception('Failed to track ticket: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal track ticket $ticketCode", e);
      if (e is DioException && e.response?.statusCode == 404) {
         throw Exception("Tiket tidak ditemukan. Mohon periksa kembali kode tiket Anda.");
      }
      rethrow;
    }
  }

  @override
  Future<TicketDetailModel> getTicketDetail({
    required String ticketId,
    required UserType userType,
  }) async {
    // ... implementation ...
    try {
      final endpoint = userType == UserType.masyarakat
          ? '/api/tickets/masyarakat/$ticketId'
          : '/api/tickets/pegawai/$ticketId';

      AppLogger.i("🔍 Fetching Ticket Detail ($userType): $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        return ActivityMapper.fromDetailJson(response.data);
      }

      throw Exception('Failed to get ticket detail: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch ticket detail", e);
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
    // ... implementation ...
    try {
      final endpoint = '/api/tickets/reopen/$ticketId';
      AppLogger.i("🔄 Reopening Ticket: $endpoint");

      final formData = FormData.fromMap({
        'alasan_reopen': reason,
        if (expectedSolution != null && expectedSolution.isNotEmpty)
          'expected_resolution': expectedSolution,
      });

      if (files != null && files.isNotEmpty) {
        for (var file in files) {
          final fileName = file.path.split('/').last;
          formData.files.add(MapEntry(
            'files',
            await MultipartFile.fromFile(file.path, filename: fileName),
          ));
        }
      }

      final response = await dio.patch(
        endpoint,
        data: formData,
      );

      if (response.statusCode == 200) {
        AppLogger.i("✅ Reopen Sukses: ${response.data}");
        return;
      }

      throw Exception('Failed to reopen ticket: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal reopen ticket", e);
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
      final endpoint = '/api/tickets/$ticketId/rating';
      AppLogger.i("⭐ Submitting Rating: $endpoint");

      // Perbaikan: Pastikan data dikirim sebagai map string sederhana
      // dan biarkan Dio menanganinya dengan contentType yang tepat.
      final body = {
        'rating': rating, // Dio akan convert int ke string saat encoding
        if (comment != null && comment.isNotEmpty) 'comment': comment,
      };

      final response = await dio.post(
        endpoint,
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType, // Wajib: application/x-www-form-urlencoded
        ),
      );

      if (response.statusCode == 200) {
        AppLogger.i("✅ Rating Sukses: ${response.data}");
        return ActivityMapper.fromSubmissionJson(response.data);
      }

      throw Exception('Failed to submit rating: ${response.statusCode}');
    } on DioException catch (e) {
      // Tambahan: Log detail error dari server untuk debugging lebih lanjut
      if (e.response != null) {
        AppLogger.e("❌ Server Error Payload: ${e.response?.data}");
      }
      AppLogger.e("Gagal submit rating (Dio Error)", e);
      rethrow;
    } catch (e) {
      AppLogger.e("Gagal submit rating (General Error)", e);
      rethrow;
    }
  }
}