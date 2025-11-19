import 'package:injectable/injectable.dart';
import 'package:report/src/modules/helpdesk/data/datasources/remote/source/abstract/helpdesk_remote_data_source.dart';
import 'package:report/src/modules/helpdesk/domain/models/chat_history_model.dart';
import 'package:report/src/modules/helpdesk/domain/repositories/helpdesk_repository.dart';

@LazySingleton(as: HelpdeskRepository)
class HelpdeskRepositoryImpl implements HelpdeskRepository {
  final HelpdeskRemoteDataSource remoteDataSource;

  HelpdeskRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> sendMessage({
    required String opdId,
    String? message,
    String? filePath,
  }) async {
    try {
      return await remoteDataSource.sendMessage(
        opdId: opdId,
        message: message,
        filePath: filePath,
      );
    } catch (e) {
      throw Exception('Gagal mengirim pesan ke Helpdesk: $e');
    }
  }

  @override
  Future<String> sendReply({
    required String chatId,
    String? message,
    String? filePath,
  }) async {
    try {
      return await remoteDataSource.sendReply(
        chatId: chatId,
        message: message,
        filePath: filePath,
      );
    } catch (e) {
      throw Exception('Gagal mengirim balasan ke Helpdesk: $e');
    }
  }

  @override
  Future<ChatHistoryModel> getChatHistory(String chatId) async {
    try {
      return await remoteDataSource.getChatHistory(chatId);
    } catch (e) {
      throw Exception('Gagal mengambil riwayat chat Helpdesk: $e');
    }
  }
}
