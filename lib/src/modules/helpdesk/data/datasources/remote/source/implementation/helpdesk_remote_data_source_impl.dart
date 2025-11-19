import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/helpdesk/data/datasources/remote/mapper/chat_history_mapper.dart';
import 'package:report/src/modules/helpdesk/data/datasources/remote/source/abstract/helpdesk_remote_data_source.dart';
import 'package:report/src/modules/helpdesk/domain/models/chat_history_model.dart';

@LazySingleton(as: HelpdeskRemoteDataSource)
class HelpdeskRemoteDataSourceImpl implements HelpdeskRemoteDataSource {
  final Dio dio;

  HelpdeskRemoteDataSourceImpl(this.dio);

  @override
  Future<String> sendMessage({
    required String opdId,
    String? message,
    String? filePath,
  }) async {
    final formData = FormData();

    formData.fields.add(MapEntry('opd_id', opdId));
    if (message != null && message.isNotEmpty) {
      formData.fields.add(MapEntry('message', message));
    }

    if (filePath != null && filePath.isNotEmpty) {
      formData.files.add(MapEntry(
        'file',
        await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
      ));
    }

    final response = await dio.post('/chat/send', data: formData);

    if (response.statusCode == 200 &&
        response.data is Map<String, dynamic> &&
        response.data['chat_id'] != null) {
      return response.data['chat_id'] as String;
    }

    throw Exception('Gagal mengirim pesan awal ke Helpdesk');
  }

  @override
  Future<String> sendReply({
    required String chatId,
    String? message,
    String? filePath,
  }) async {
    final formData = FormData();

    if (message != null && message.isNotEmpty) {
      formData.fields.add(MapEntry('message', message));
    }

    if (filePath != null && filePath.isNotEmpty) {
      formData.files.add(MapEntry(
        'file',
        await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
      ));
    }

    final response = await dio.post('/chat/$chatId/send', data: formData);

    if (response.statusCode == 200 &&
        response.data is Map<String, dynamic> &&
        response.data['chat_id'] != null) {
      return response.data['chat_id'] as String;
    }

    throw Exception('Gagal mengirim balasan ke Helpdesk');
  }

  /// 📜 Ambil riwayat percakapan berdasarkan chatId
  @override
  Future<ChatHistoryModel> getChatHistory(String chatId) async {
    final response = await dio.get('/chat/history/$chatId');

    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      return ChatHistoryMapper.fromJson(response.data);
    }

    throw Exception('Gagal mengambil riwayat percakapan Helpdesk');
  }
}
