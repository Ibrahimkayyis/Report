import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/teknisi_home/data/datasources/remote/mapper/teknisi_dashboard_mapper.dart';
import 'package:report/src/modules/teknisi_home/data/datasources/remote/mapper/teknisi_ticket_mapper.dart';
import 'package:report/src/modules/teknisi_home/data/datasources/remote/source/abstract/teknisi_home_remote_data_source.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_dashboard_summary_model.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';



@LazySingleton(as: TeknisiHomeRemoteDataSource)
class TeknisiHomeRemoteDataSourceImpl implements TeknisiHomeRemoteDataSource {
  final Dio dio;

  TeknisiHomeRemoteDataSourceImpl(this.dio);

  @override
  Future<TeknisiTicketResponse> getTeknisiTickets() async {
    try {
      const endpoint = '/api/tickets/teknisi';
      AppLogger.i("📡 Fetching Teknisi Tickets: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final result = TeknisiTicketMapper.fromResponse(response.data);
        AppLogger.i("✅ Loaded ${result.total} tickets");
        return result;
      }

      throw Exception('Failed to load tickets: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch teknisi tickets", e);
      rethrow;
    }
  }

  // ✅ Method Baru: Get Dashboard Summary
  @override
  Future<TeknisiDashboardSummaryModel> getDashboardSummary() async {
    try {
      const endpoint = '/api/dashboard/teknisi/summary';
      AppLogger.i("📡 Fetching Dashboard Summary: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        AppLogger.d("✅ Dashboard Summary fetched successfully");
        
        // Panggil Mapper
        return TeknisiDashboardMapper.mapToModel(data);
      }

      throw Exception('Failed to load dashboard summary: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("❌ Error fetching dashboard summary", e);
      rethrow;
    }
  }
}