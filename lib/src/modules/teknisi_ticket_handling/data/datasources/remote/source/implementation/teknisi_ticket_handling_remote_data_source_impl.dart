import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/teknisi_ticket_handling/data/datasources/remote/mapper/teknisi_ticket_detail_mapper.dart';
import 'package:report/src/modules/teknisi_ticket_handling/data/datasources/remote/source/abstract/teknisi_ticket_handling_remote_data_source.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';

@LazySingleton(as: TeknisiTicketHandlingRemoteDataSource)
class TeknisiTicketHandlingRemoteDataSourceImpl
    implements TeknisiTicketHandlingRemoteDataSource {
  final Dio dio;

  TeknisiTicketHandlingRemoteDataSourceImpl(this.dio);

  @override
  Future<TeknisiTicketDetailModel> getTicketDetail(String ticketId) async {
    try {
      final endpoint = '/api/tickets/teknisi/$ticketId';
      AppLogger.i("📡 Fetching Ticket Detail: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final data = response.data;
        AppLogger.i("✅ Ticket Detail Loaded: ${data['ticket_code']}");
        return TeknisiTicketDetailMapper.fromJson(data);
      }

      throw Exception('Failed to load ticket detail: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch ticket detail", e);
      rethrow;
    }
  }

  @override
  Future<void> startTicketProcess(String ticketId) async {
    try {
      final endpoint = '/api/tickets/teknisi/$ticketId/process';
      AppLogger.i("🚀 Starting Ticket Process: $endpoint");

      // Method PUT sesuai dokumentasi
      final response = await dio.put(endpoint);

      if (response.statusCode == 200) {
        AppLogger.i("✅ Ticket status updated to: Process");
        return;
      }

      throw Exception('Failed to start process: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal start process", e);
      rethrow;
    }
  }

  @override
  Future<void> completeTicket(String ticketId) async {
    try {
      final endpoint = '/api/tickets/teknisi/$ticketId/complete';
      AppLogger.i("✅ Completing Ticket: $endpoint");

      // Method PUT sesuai dokumentasi
      final response = await dio.put(endpoint);

      if (response.statusCode == 200) {
        AppLogger.i("✅ Ticket status updated to: Completed");
        return;
      }

      throw Exception('Failed to complete ticket: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal complete ticket", e);
      rethrow;
    }
  }
}