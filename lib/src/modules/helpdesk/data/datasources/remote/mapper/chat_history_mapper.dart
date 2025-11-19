import 'package:report/src/modules/helpdesk/domain/models/chat_history_model.dart';
import 'package:report/src/modules/helpdesk/data/datasources/remote/mapper/chat_message_mapper.dart';

class ChatHistoryMapper {
  static ChatHistoryModel fromJson(Map<String, dynamic> json) {
    return ChatHistoryModel(
      chatId: json['chat_id'] as String,
      opdId: json['opd_id'] as String,
      messages: json['messages'] != null
          ? ChatMessageMapper.fromJsonList(json['messages'] as List)
          : [],
    );
  }
}
