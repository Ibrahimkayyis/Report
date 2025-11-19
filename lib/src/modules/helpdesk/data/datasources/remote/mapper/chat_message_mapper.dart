import 'package:report/src/modules/helpdesk/domain/models/chat_message_model.dart';

class ChatMessageMapper {
  static ChatMessageModel fromJson(Map<String, dynamic> json) {
    final createdAtRaw = json['created_at'] ?? json['sent_at'];

    DateTime parsedDate;
    try {
      parsedDate = DateTime.parse(createdAtRaw as String);
    } catch (_) {
      parsedDate = DateTime.now();
    }

    return ChatMessageModel(
      messageId: json['message_id'] as String? ?? '',
      senderId: json['sender_id'] as String? ?? '',
      message: json['message'] as String?,
      createdAt: parsedDate,
      fileUrl: json['file_url'] as String?,
      fileType: json['file_type'] as String?,
      role: json['role'] as String? ?? 'user',
    );
  }

  static List<ChatMessageModel> fromJsonList(List<dynamic> list) {
    return list
        .map((e) => fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
