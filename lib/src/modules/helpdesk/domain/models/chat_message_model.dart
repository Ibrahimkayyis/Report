import 'package:equatable/equatable.dart';

class ChatMessageModel extends Equatable {
  final String messageId;
  final String senderId;
  final String? message;
  final DateTime createdAt;
  final String? fileUrl;
  final String? fileType;
  final String role;

  const ChatMessageModel({
    required this.messageId,
    required this.senderId,
    this.message,
    required this.createdAt,
    this.fileUrl,
    this.fileType,
    required this.role,
  });

  @override
  List<Object?> get props => [
        messageId,
        senderId,
        message,
        createdAt,
        fileUrl,
        fileType,
        role,
      ];
}
