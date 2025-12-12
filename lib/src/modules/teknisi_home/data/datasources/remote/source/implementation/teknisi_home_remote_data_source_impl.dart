import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/teknisi_home/data/datasources/remote/mapper/teknisi_ticket_mapper.dart';
import 'package:report/src/modules/teknisi_home/data/datasources/remote/source/abstract/teknisi_home_remote_data_source.dart';
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
        // Mapping Response (Total + Data List)
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
}