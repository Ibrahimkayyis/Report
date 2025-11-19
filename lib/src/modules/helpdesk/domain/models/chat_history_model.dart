import 'package:equatable/equatable.dart';
import 'chat_message_model.dart';

class ChatHistoryModel extends Equatable {
  final String chatId;
  final String opdId;
  final List<ChatMessageModel> messages;

  const ChatHistoryModel({
    required this.chatId,
    required this.opdId,
    required this.messages,
  });

  @override
  List<Object?> get props => [chatId, opdId, messages];
}
