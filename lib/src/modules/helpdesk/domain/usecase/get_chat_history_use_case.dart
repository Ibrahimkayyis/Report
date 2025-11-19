import 'package:injectable/injectable.dart';
import 'package:report/src/modules/helpdesk/domain/models/chat_history_model.dart';
import 'package:report/src/modules/helpdesk/domain/repositories/helpdesk_repository.dart';

@injectable
class GetChatHistoryUseCase {
  final HelpdeskRepository repository;

  GetChatHistoryUseCase(this.repository);

  Future<ChatHistoryModel> call(String chatId) async {
    try {
      return await repository.getChatHistory(chatId);
    } catch (e) {
      throw Exception('Gagal mengambil riwayat chat Helpdesk: $e');
    }
  }
}
