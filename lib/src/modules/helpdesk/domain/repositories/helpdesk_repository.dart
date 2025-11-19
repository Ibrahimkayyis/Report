import 'package:report/src/modules/helpdesk/domain/models/chat_history_model.dart';

abstract class HelpdeskRepository {
  Future<String> sendMessage({
    required String opdId,
    String? message,
    String? filePath,
  });

  Future<String> sendReply({
    required String chatId,
    String? message,
    String? filePath,
  });

  Future<ChatHistoryModel> getChatHistory(String chatId);
}
